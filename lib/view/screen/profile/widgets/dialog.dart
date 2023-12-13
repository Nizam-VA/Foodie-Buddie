import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddie/controller/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:foodiebuddie/view/screen/login/screen_login_signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

showDialogBox(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure to logout?'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Logout'),
              onPressed: () async {
                final preferences = await SharedPreferences.getInstance();
                preferences.setString('token', '');

                SharedPreferences sPreferences =
                    await SharedPreferences.getInstance();
                sPreferences.setBool('LOGIN', false);
                context
                    .read<BottomNavigationBloc>()
                    .add(BottomNavigationEvent(index: 0));
                Navigator.pop(context);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const ScreenLoginSignUp()),
                    (route) => false);
              },
            ),
          ],
        );
      });
}
