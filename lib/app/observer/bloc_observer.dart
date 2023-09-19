import 'package:app_ui/app_ui.dart';
import 'package:bloc/bloc.dart';

final class AppBlocObserver extends BlocObserver {
/*  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    AppLogger.logInfo(event.toString());
  }*/

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    AppLogger.logError(error.toString());
    super.onError(bloc, error, stackTrace);
  }

/*  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    AppLogger.logInfo(change.toString());
  }*/

/* @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    AppLogger.logInfo(transition.toString());
  }*/
}
