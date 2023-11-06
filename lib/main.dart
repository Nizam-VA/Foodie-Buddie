import 'package:flutter/material.dart';
import 'package:foodiebuddie/view/screen/splash/screen_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'montserrat',
        primarySwatch: Colors.green,
      ),
      home: ScreenSplash(),
    );
  }
}