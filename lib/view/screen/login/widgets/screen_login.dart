import 'package:flutter/material.dart';
import 'package:foodiebuddie/core/constants.dart';
import 'package:foodiebuddie/view/screen/forgot_password/screen_forgot_password.dart';
import 'package:foodiebuddie/view/widgets/button_widget.dart';
import 'package:foodiebuddie/view/widgets/text_button_widget.dart';
import 'package:foodiebuddie/view/widgets/text_field_widget.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});

  final formKey = GlobalKey<FormState>();
  final userController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.all(24),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kHight100,
            const Text('Welcome',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            const Text('Login to your account', style: TextStyle(fontSize: 18)),
            kHight30,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFieldWidget(
                  userController: userController,
                  label: 'Email-address:',
                  inputType: TextInputType.emailAddress,
                  obscureText: false,
                ),
                kHight10,
                TextFieldWidget(
                  userController: passController,
                  label: 'Password:',
                  inputType: TextInputType.name,
                  obscureText: true,
                ),
                kHight10,
                TextButtonWidget(
                  width: width,
                  text: 'Forgot password?',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ScreenForgotPassword(),
                      ),
                    );
                  },
                ),
                kHight10,
                ButtonWidget(
                  width: width,
                  text: 'Login',
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
