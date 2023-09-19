import 'package:app_ui/app_ui.dart';
import 'package:app_ui/src/mixins/validation_mixin.dart';
import 'package:app_ui/src/widgets/password_indicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum _AuthTextFieldType { email, password }

@immutable
final class AuthTextField extends StatefulWidget {
  // ignore: unused_element
  const AuthTextField._(
    this._passwordErrorText,
    this._emailErrorText,
    this._labelText,
    this._hintText,
    this._enabled,
    this._autoFocus,
    this._authTextFieldType,
    this._controller,
    this._letterSpacing,
    this._focusNode,
    this._textInputAction,
    this._onEditingCompleted,
    this._onChanged,
    this._textInputType,
    this._showPasswordIndicator,
  );

  const AuthTextField.email({
    super.key,
    required String labelText,
    required String hintText,
    required String emailErrorText,
    bool enabled = true,
    bool autoFocus = false,
    FocusNode? focusNode,
    TextInputAction? textInputAction,
    TextEditingController? controller,
    VoidCallback? onEditingCompleted,
    ValueChanged<String>? onChanged,
    double letterSpacing = 3,
  })  : _authTextFieldType = _AuthTextFieldType.email,
        _textInputType = TextInputType.emailAddress,
        _focusNode = focusNode,
        _textInputAction = textInputAction,
        _controller = controller,
        _onEditingCompleted = onEditingCompleted,
        _onChanged = onChanged,
        _letterSpacing = letterSpacing,
        _emailErrorText = emailErrorText,
        _passwordErrorText = null,
        _showPasswordIndicator = false,
        _hintText = hintText,
        _labelText = labelText,
        _autoFocus = autoFocus,
        _enabled = enabled;

  const AuthTextField.password({
    super.key,
    required String labelText,
    required String hintText,
    required String passwordErrorText,
    bool showStrengthIndicator = true,
    bool enabled = true,
    bool autoFocus = false,
    FocusNode? focusNode,
    TextInputAction? textInputAction,
    TextEditingController? controller,
    VoidCallback? onEditingCompleted,
    ValueChanged<String>? onChanged,
  })  : _authTextFieldType = _AuthTextFieldType.password,
        _textInputType = TextInputType.visiblePassword,
        _focusNode = focusNode,
        _textInputAction = textInputAction,
        _controller = controller,
        _onEditingCompleted = onEditingCompleted,
        _onChanged = onChanged,
        _letterSpacing = 3,
        _passwordErrorText = passwordErrorText,
        _emailErrorText = null,
        _showPasswordIndicator = showStrengthIndicator,
        _labelText = labelText,
        _hintText = hintText,
        _autoFocus = autoFocus,
        _enabled = enabled;

  final String _labelText;
  final String _hintText;
  final String? _emailErrorText;
  final String? _passwordErrorText;
  final bool _enabled;
  final bool _autoFocus;
  final bool _showPasswordIndicator;

  final _AuthTextFieldType _authTextFieldType;
  final TextEditingController? _controller;
  final double? _letterSpacing;
  final FocusNode? _focusNode;
  final TextInputAction? _textInputAction;
  final VoidCallback? _onEditingCompleted;
  final ValueChanged<String>? _onChanged;

  final TextInputType? _textInputType;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

final class _AuthTextFieldState extends State<AuthTextField>
    with ValidationMixin {
  late final _AuthTextFieldType authTextFieldType;
  late final bool enabled;
  late final TextEditingController textEditingController;
  late final FocusNode focusNode;
  late bool passwordVisibility;
  bool hasFocus = false;
  int passwordStrength = 0;

  void focusListener() {
    setState(() {
      hasFocus = focusNode.hasFocus;
    });
  }

  @override
  void initState() {
    authTextFieldType = widget._authTextFieldType;
    textEditingController = widget._controller ?? TextEditingController();
    focusNode = widget._focusNode ?? FocusNode();
    enabled = widget._enabled;
    passwordVisibility = false;
    focusNode.addListener(focusListener);

    super.initState();
  }

  void changeVisibility() {
    setState(() {
      passwordVisibility = !passwordVisibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget._labelText,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontWeight: FontWeight.w400,
              ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          style: TextStyle(
            letterSpacing: widget._letterSpacing,
          ),
          controller: textEditingController,
          onChanged: (value) {
            setState(() {
              passwordStrength = passwordValidateValue(value);
            });
            widget._onChanged?.call(value);
          },
          textInputAction: widget._textInputAction,
          keyboardType: widget._textInputType,
          enabled: enabled,
          autofocus: widget._autoFocus,
          focusNode: focusNode,
          validator: (value) {
            if (authTextFieldType == _AuthTextFieldType.email) {
              return emailValidator(value, widget._emailErrorText!);
            } else {
              return passwordValidator(value, widget._passwordErrorText!);
            }
          },
          onEditingComplete: widget._onEditingCompleted,
          decoration: InputDecoration(
            hintText: widget._hintText,
            errorMaxLines: 5,
            helperMaxLines: 5,
            counter: authTextFieldType == _AuthTextFieldType.password &&
                    hasFocus &&
                    passwordStrength <= 5 &&
                    widget._showPasswordIndicator
                ? Column(
                    children: [
                      PasswordIndicator(value: passwordStrength),
                      Text(
                        widget._passwordErrorText!,
                        style: TextStyle(
                          fontSize: 11.1,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  )
                : null,
            suffixIcon: authTextFieldType == _AuthTextFieldType.password
                ? AdaptiveIconButton(
                    icon: passwordVisibility
                        ? FontAwesomeIcons.eyeSlash
                        : FontAwesomeIcons.eye,
                    size: 20,
                    onPressed: changeVisibility,
                  )
                : null,
          ),
          obscureText: authTextFieldType == _AuthTextFieldType.password &&
              !passwordVisibility,
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.removeListener(focusListener);
    textEditingController.dispose();
  }
}
