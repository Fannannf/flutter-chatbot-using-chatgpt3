import 'package:chat_gpt/components/app_button.dart';
import 'package:chat_gpt/components/app_textfield.dart';
import 'package:chat_gpt/config/app_route.dart';
import 'package:chat_gpt/providers/auth_providers.dart';
import 'package:chat_gpt/services/Auth/auth_service.dart';
import 'package:chat_gpt/styles/app_color.dart';
import 'package:chat_gpt/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInPage extends StatefulWidget {
  final void Function()? onTap;
  SignInPage({super.key, this.onTap});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final username = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign in", style: AppText.headline3),
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
              await _auth.signInWithEmailandPassword(
                  username.text, password.text, context);
            } catch (e) {
              print(password.text);
            }
          }

          Future<void> _loginWithGoogle() async {
            await _auth
                .signInWithGoogle(context)
                .whenComplete(() => _auth.authStateChange.listen((event) async {
                      if (event == null) {
                        print("Error");
                      }
                    }));
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
                    "Let's you sign in",
                    style: AppText.headline1,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Welcome back you have been missed",
                    style: AppText.textStyle3.copyWith(
                      color: AppColor.blackColor.withOpacity(0.45),
                    ),
                  ),
                  SizedBox(height: 45),
                  AppTextField(
                    username,
                  ),
                  SizedBox(height: 25),
                  AppTextField(
                    password,
                    label: "Password",
                    hintText: "Input your password",
                    preffixIcon: Icon(
                      Icons.lock,
                    ),
                    obsureText: true,
                  ),
                  SizedBox(height: 8),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: AppText.textStyle3.copyWith(
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  GestureDetector(
                    onTap: _onPress,
                    child: AppButton(
                      content: Text(
                        "Sign In",
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
                  GestureDetector(
                    onTap: _loginWithGoogle,
                    child: AppButton(
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
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: AppText.textStyle4,
                      ),
                      TextButton(
                        onPressed: widget.onTap,
                        child: Text(
                          "Signup here",
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
