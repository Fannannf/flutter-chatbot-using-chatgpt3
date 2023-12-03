import 'package:chat_gpt/pages/AuthPage/signin_page.dart';
import 'package:chat_gpt/pages/AuthPage/signup_page.dart';
import 'package:chat_gpt/pages/chat_page.dart';
import 'package:chat_gpt/pages/screensplash.dart';

class AppRoute {
  static final pages = {
    splashscreen: (context) => SplashScreen(),
    signin: (context) => SignInPage(),
    signup: (context) => SignUpPage(),
    chatpage: (context) => ChatPage(),
  };
  static const splashscreen = '/';
  static const signin = '/signin';
  static const signup = '/signup';
  static const chatpage = '/chatpage';
}
