import 'package:chat_gpt/config/app_route.dart';
import 'package:chat_gpt/styles/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Chat with GPT",
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.whiteColor,
      ),
      initialRoute: AppRoute.splashscreen,
      routes: AppRoute.pages,
    );
  }
}
