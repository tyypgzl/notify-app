import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

@immutable
class BasicWebView extends StatefulWidget {
  const BasicWebView({
    super.key,
    required this.uri,
    required this.title,
  });

  final Uri uri;
  final String title;

  @override
  State<BasicWebView> createState() => _BasicWebViewState();
}

class _BasicWebViewState extends State<BasicWebView> {
  late final WebViewController controller;
  bool _isShowProgressBar = false;
  int _progressValue = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      late final PlatformWebViewControllerCreationParams params;
      if (WebViewPlatform.instance is WebKitWebViewPlatform) {
        params = WebKitWebViewControllerCreationParams(
          allowsInlineMediaPlayback: true,
          mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
        );
      } else if (WebViewPlatform.instance is AndroidWebViewPlatform) {
        params = AndroidWebViewControllerCreationParams();
      } else {
        params = const PlatformWebViewControllerCreationParams();
      }

      controller = WebViewController.fromPlatformCreationParams(params);
// ···
      if (controller.platform is AndroidWebViewController) {
        AndroidWebViewController.enableDebugging(true);
        (controller.platform as AndroidWebViewController)
            .setMediaPlaybackRequiresUserGesture(false);
      }

      controller
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(Colors.white)
        ..setNavigationDelegate(
          NavigationDelegate(
            onPageStarted: (url) {
              setState(() {
                _isShowProgressBar = true;
              });
            },
            onPageFinished: (url) {
              setState(() {
                _isShowProgressBar = false;
              });
            },
            onProgress: (progress) {
              setState(() {
                _progressValue = progress;
              });
            },
          ),
        )
        ..loadRequest(widget.uri);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Theme.of(context).colorScheme.primary,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        leading: AdaptiveIconButton(
          icon: Icons.close,
          color: Theme.of(context).colorScheme.onPrimary,
          size: 36,
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
      ),
      body: Stack(
        children: [
          RepaintBoundary(
            child: Visibility(
              visible: _isShowProgressBar,
              child: LinearProgressIndicator(
                value: _progressValue.toDouble(),
                minHeight: 30,
              ),
            ),
          ),
          WebViewWidget(
            controller: controller,
          ),
        ],
      ),
    );
  }
}
