import 'package:flutter/material.dart';
import 'package:foodiebuddie/view/screen/login/screen_login_signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key, required this.width, required this.position});

  final double width;
  final int position;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: width * .3,
          child: ElevatedButton(
            onPressed: () async {
              SharedPreferences preferences =
                  await SharedPreferences.getInstance();
              preferences.setBool('ON_BOARD', true);
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ScreenLoginSignUp()));
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: Text(position == 2 ? "Let's Start" : 'Skip'),
          ),
        ),
      ],
    );
  }
}
