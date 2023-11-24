import 'package:flutter/material.dart';
import 'package:foodiebuddie/view/screen/login/screen_login_signup.dart';
import 'package:foodiebuddie/view/screen/on_boarding/screen_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    checkUserOnBoarding();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      body: Center(
        child: Image.asset(
          'assets/images/food-app.png',
          height: 80,
        ),
      ),
    );
  }

  Future<void> gotoLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const ScreenLoginSignUp(),
      ),
    );
  }

  Future<void> checkUserOnBoarding() async {
    final preferences = await SharedPreferences.getInstance();
    final userLoggedIn = preferences.getBool('ON_BOARD');
    if (userLoggedIn == null || userLoggedIn == false) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => const ScreenOnBoarding(),
        ),
      );
    } else {
      await Future.delayed(const Duration(seconds: 3));
      gotoLogin();
    }
  }
}
