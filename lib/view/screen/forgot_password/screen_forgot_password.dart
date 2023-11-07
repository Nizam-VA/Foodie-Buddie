import 'package:flutter/material.dart';
import 'package:foodiebuddie/core/constants.dart';
import 'package:foodiebuddie/view/widgets/button_widget.dart';
import 'package:foodiebuddie/view/widgets/text_field_widget.dart';

class ScreenForgotPassword extends StatelessWidget {
  ScreenForgotPassword({super.key});

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kHight50,
            const Text(
              'Forgot password',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            kHight20,
            Text(
              'Enter you E-mail id:',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            kHight10,
            TextFieldWidget(
              userController: emailController,
              label: 'E-mail id:',
              inputType: TextInputType.emailAddress,
              obscureText: false,
            ),
            kHight20,
            Container(
              alignment: Alignment.center,
              child: ButtonWidget(
                width: width,
                text: 'Send',
                onPressed: () {},
              ),
            )
          ],
        ),
      )),
    );
  }
}
