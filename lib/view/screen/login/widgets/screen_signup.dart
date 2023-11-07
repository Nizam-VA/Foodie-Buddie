import 'package:flutter/material.dart';
import 'package:foodiebuddie/core/constants.dart';
import 'package:foodiebuddie/view/screen/otp/screen_otp.dart';
import 'package:foodiebuddie/view/widgets/button_widget.dart';
import 'package:foodiebuddie/view/widgets/text_field_widget.dart';

class ScreenSignUp extends StatelessWidget {
  ScreenSignUp({super.key});

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final rePassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kHight10,
            const Text('Welcome',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            const Text('Login to your account', style: TextStyle(fontSize: 18)),
            kHight20,
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFieldWidget(
                  userController: emailController,
                  label: 'E-mail id:',
                  inputType: TextInputType.emailAddress,
                  obscureText: false,
                ),
                kHight10,
                TextFieldWidget(
                  userController: nameController,
                  label: 'Full Name:',
                  inputType: TextInputType.name,
                  obscureText: false,
                ),
                kHight10,
                TextFieldWidget(
                  userController: mobileController,
                  label: 'Phone Number:',
                  inputType: TextInputType.number,
                  obscureText: false,
                ),
                kHight10,
                TextFieldWidget(
                  userController: passwordController,
                  label: 'Password:',
                  inputType: TextInputType.name,
                  obscureText: true,
                ),
                kHight10,
                TextFieldWidget(
                  userController: rePassController,
                  label: 'Re-enter Password:',
                  inputType: TextInputType.name,
                  obscureText: true,
                ),
                kHight20,
                ButtonWidget(
                  width: width,
                  text: 'Sign Up',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ScreenOTP(),
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
