import 'package:bloc/bloc.dart';
import 'package:notify/utils/locator/service_locator.dart';
import 'package:notify/utils/router/router.dart';

class StartCubit extends Cubit<void> {
  StartCubit() : super(null);

  final _router = getIt<AppRouter>();

  void pushToLogin() {
    _router.pushNamed(AppRoutes.login.path);
  }

  void pushToRegister() {
    _router.pushNamed(AppRoutes.register.path);
  }
}
