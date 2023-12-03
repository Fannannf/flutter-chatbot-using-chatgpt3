import 'package:chat_gpt/pages/AuthPage/signin_page.dart';
import 'package:chat_gpt/pages/AuthPage/signup_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool togglePress = true;

  void toggle() {
    setState(() {
      togglePress = !togglePress;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (togglePress) {
      return SignInPage(
        onTap: toggle,
      );
    } else {
      return SignUpPage(
        onTap: toggle,
      );
    }
    ;
  }
}
