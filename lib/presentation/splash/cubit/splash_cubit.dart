import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notify/config/router/app_router.dart';
import 'package:notify/utils/locator/service_locator.dart';

part 'splash_state.dart';

final class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState.init());

  final _router = getIt<AppRouter>();

  void navigate() {
    _router.replace(const OnboardRoute());
  }
}
