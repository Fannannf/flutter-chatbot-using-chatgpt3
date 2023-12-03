import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:chat_gpt/pages/AuthPage/signin_page.dart';
import 'package:chat_gpt/pages/AuthPage/signup_page.dart';
import 'package:chat_gpt/services/Auth/auth_check.dart';
import 'package:chat_gpt/styles/app_color.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: AnimatedSplashScreen(
            duration: 1500,
            splash: "assets/images/logo.png",
            splashIconSize: 120,
            nextScreen: AuthChecker(),
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: AppColor.primaryColor,
          ),
        ),
      ),
    );
  }
}
