import 'package:flutter/material.dart';
import 'package:foodiebuddie/view/screen/login/widgets/screen_login.dart';
import 'package:foodiebuddie/view/screen/login/widgets/screen_signup.dart';

class ScreenLoginSignUp extends StatelessWidget {
  const ScreenLoginSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(tabs: [
            Tab(text: 'Login'),
            Tab(text: 'Sign Up'),
          ]),
          title: const Text('Foodie Buddie'),
          centerTitle: true,
        ),
        body: TabBarView(children: [ScreenLogin(), ScreenSignUp()]),
      ),
    );
  }
}
