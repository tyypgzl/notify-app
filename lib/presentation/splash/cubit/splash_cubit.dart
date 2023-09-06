import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:go_router/go_router.dart';
import 'package:notify/data/repositories/auth/auth.dart';
import 'package:notify/presentation/authentication/start/view/start_page.dart';
import 'package:notify/presentation/onboard/onboard.dart';

part 'splash_state.dart';

final class SplashCubit extends Cubit<SplashState> {
  SplashCubit({
    required GoRouter router,
    required IAuthRepository authRepository,
  })  : _authRepository = authRepository,
        _router = router,
        super(const SplashState.init());

  final GoRouter _router;
  final IAuthRepository _authRepository;

  Future<void> navigate() async {
    final result = await _authRepository.readOnboardStatus();
    if (result != null) {
      await _router.pushReplacement(StartPage.location);
    } else {
      await _router.pushReplacement(OnboardPage.location);
    }
  }
}
