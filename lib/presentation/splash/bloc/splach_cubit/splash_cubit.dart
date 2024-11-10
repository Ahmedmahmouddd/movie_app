import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/auth/usecases/is_logged_in.dart';
import 'package:movie_app/presentation/splash/bloc/splach_cubit/splash_state.dart';
import 'package:movie_app/service_locator.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplashState());

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 2));
    var isLoggedIn = await sl<IsLoggedInUseCase>().call();
    if (isLoggedIn) {
      emit(AuthinticatedSplashState());
    } else {
      emit(UnAuthinticatedSplashState());
    }
  }
}
