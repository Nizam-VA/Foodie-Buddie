import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddie/controller/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:foodiebuddie/view/screen/login/screen_login_signup.dart';

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
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Logout'),
              onPressed: () {
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
