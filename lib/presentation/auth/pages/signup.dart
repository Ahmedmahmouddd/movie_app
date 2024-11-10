// ignore_for_file: use_build_context_synchronously

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/common/widgets/display_message/display_snacks.dart';
import 'package:movie_app/common/helper/utils/utilities.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/data/auth/models/signup_req_param.dart';
import 'package:movie_app/domain/auth/usecases/signup.dart';
import 'package:movie_app/presentation/auth/pages/signin.dart';
import 'package:movie_app/presentation/home/pages/home_page.dart';
import 'package:movie_app/service_locator.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      minimum: const EdgeInsets.only(top: 100, right: 16, left: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          signupText(),
          sbH(30),
          emailField(),
          sbH(18),
          passwordField(),
          sbH(30),
          styledButton(context),
          sbH(18),
          signUpText(context),
        ],
      ),
    ));
  }

  Widget signupText() {
    return const Text('Sign Up', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24));
  }

  Widget emailField() {
    return TextField(
        cursorColor: Colors.white,
        controller: emailController,
        decoration: const InputDecoration(hintText: 'Email'));
  }


  Widget passwordField() {
    return TextField(
        cursorColor: Colors.white,
        controller: passwordController,
        decoration: const InputDecoration(hintText: 'Password'));
  }

  Widget styledButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(AppColors.primary),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          elevation: WidgetStateProperty.all(15),
        ),
        onPressed: () async {
          if (emailController.text.isEmpty || passwordController.text.isEmpty) {
            DisplaySnack.errMessage(context, 'Email and password cannot be empty');
            return;
          }
          try {
            final result = await sl<SignupUseCase>().call(
                params: SignupReqParam(
              email: emailController.text,
              password: passwordController.text,
            ));

            result.fold(
              (failure) => DisplaySnack.errMessage(context, failure.toString()),
              (success) => AppNavigation.pushAndRemoveUntil(context, const HomePage()),
            );
          } catch (error) {
            DisplaySnack.errMessage(context, 'An unexpected error occurred');
          }
        },
        child: const Text('Sign Up',
            style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget signUpText(BuildContext context) {
    return Text.rich(TextSpan(children: [
      const TextSpan(text: 'Already have an account? '),
      TextSpan(
          text: 'Sign In',
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              AppNavigation.push(context, SigninPage());
            },
          style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w500)),
    ]));
  }
}
