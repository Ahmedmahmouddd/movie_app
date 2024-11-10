import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/core/assets/app_images.dart';
import 'package:movie_app/presentation/auth/pages/signin.dart';
import 'package:movie_app/presentation/home/pages/home_page.dart';
import 'package:movie_app/presentation/splash/bloc/splach_cubit/splash_cubit.dart';
import 'package:movie_app/presentation/splash/bloc/splach_cubit/splash_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is AuthinticatedSplashState) {
            AppNavigation.pushReplacement(context, const HomePage());
          } else if (state is UnAuthinticatedSplashState) {
            AppNavigation.pushReplacement(context, SigninPage());
          }
        },
        child: Stack(
          children: [
            Container(
                decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage(AppImages.splashBackground), fit: BoxFit.cover),
            )),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Color.fromARGB(255, 15, 15, 15)],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
