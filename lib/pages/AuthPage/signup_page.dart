import 'package:chat_gpt/components/app_button.dart';
import 'package:chat_gpt/components/app_textfield.dart';
import 'package:chat_gpt/config/app_route.dart';
import 'package:chat_gpt/providers/auth_providers.dart';
import 'package:chat_gpt/styles/app_color.dart';
import 'package:chat_gpt/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpPage extends StatefulWidget {
  final void Function()? onTap;
  SignUpPage({super.key, this.onTap});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up", style: AppText.headline3),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColor.whiteColor,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            height: 1,
            color: AppColor.blackColor.withOpacity(0.45),
          ),
        ),
      ),
      body: Consumer(
        builder: (context, ref, _) {
          final _auth = ref.watch(authenticationProvider);

          Future<void> _onPress() async {
            try {
              await _auth.signupWithEmailandPassword(
                  _email.text, _password.text, context);
            } catch (e) {
              print(_password.text);
            }
          }

          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    "Welcome to ChatLove.",
                    style: AppText.headline1,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "And enjoy the during the time you are here",
                    style: AppText.textStyle3.copyWith(
                      color: AppColor.blackColor.withOpacity(0.45),
                    ),
                  ),
                  SizedBox(height: 45),
                  AppTextField(
                    _username,
                  ),
                  SizedBox(height: 25),
                  AppTextField(
                    _email,
                    hintText: "Input your email address",
                    label: "Email address",
                    preffixIcon: Icon(Icons.email),
                  ),
                  SizedBox(height: 25),
                  AppTextField(
                    _password,
                    label: "Password",
                    hintText: "Input your password",
                    preffixIcon: Icon(
                      Icons.lock,
                    ),
                    obsureText: true,
                  ),
                  SizedBox(height: 8),
                  Row(),
                  SizedBox(height: 40),
                  GestureDetector(
                    onTap: _onPress,
                    child: AppButton(
                      content: Text(
                        "Sign Up",
                        style: AppText.headline3.copyWith(
                          color: AppColor.whiteColor,
                        ),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.blackColor.withOpacity(0.25),
                          offset:
                              Offset(0, 4), // mengatur offset bayangan (x, y)
                          blurRadius: 4, // mengatur blur radius bayangan
                          spreadRadius: 0, // mengatur spread radius bayangan
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  AppButton(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/google.png',
                          width: 29,
                          height: 29,
                        ),
                        SizedBox(width: 10),
                        Text("Sign in with Google"),
                      ],
                    ),
                    color: AppColor.whiteColor,
                    border: Border.all(
                      width: 1,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have account?",
                        style: AppText.textStyle4,
                      ),
                      TextButton(
                        onPressed: widget.onTap,
                        child: Text(
                          "Signin here",
                          style: AppText.textStyle4.copyWith(
                            color: AppColor.primaryColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
