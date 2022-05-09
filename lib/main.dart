import 'package:flutter/material.dart';
import 'package:login_app/Screens/welcome_page.dart';
import 'package:login_app/Screens/login_page.dart';
import 'package:login_app/Screens/Home/main_page.dart';
import 'package:login_app/Screens/register_page.dart';
import 'package:login_app/Screens/TOS_Page.dart';
import 'package:login_app/Screens/PP_Page.dart';
import 'package:login_app/Screens/forpass_page.dart';
import 'package:login_app/Screens/resetpass_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(),
      theme: ThemeData(splashColor: Colors.white),
      debugShowCheckedModeBanner: false,
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => const WelcomePage(),
        '/home': (context) => MainPage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/TOS': (context) => const TOSPage(),
        '/PP': (context) => const PPPage(),
        '/forgot': (context) => ForpassPage(),
        '/reset': (context) => ResetpassPage(),
      },
    );
  }
}
