import 'package:flutter/material.dart';
import 'package:foodiebuddie/controller/api_services/api_calls.dart';
import 'package:foodiebuddie/core/constants.dart';
import 'package:foodiebuddie/model/user.dart';
import 'package:foodiebuddie/view/screen/otp/screen_otp.dart';
import 'package:foodiebuddie/view/widgets/button_widget.dart';
import 'package:foodiebuddie/view/widgets/text_field_widget.dart';

class ScreenSignUp extends StatelessWidget {
  ScreenSignUp({super.key});
  final formKey = GlobalKey<FormState>();
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
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFieldWidget(
                    userController: emailController,
                    validator: (value) {
                      const pattern =
                          r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
                          r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
                          r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
                          r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
                          r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
                          r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
                          r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
                      final regex = RegExp(pattern);

                      return value!.isEmpty || !regex.hasMatch(value)
                          ? 'Enter a valid email address'
                          : null;
                    },
                    label: 'E-mail id:',
                    inputType: TextInputType.emailAddress,
                    obscureText: false,
                  ),
                  kHight10,
                  TextFieldWidget(
                    userController: nameController,
                    validator: (value) {
                      if (value!.isEmpty) return 'Enter your name';
                    },
                    label: 'Full Name:',
                    inputType: TextInputType.name,
                    obscureText: false,
                  ),
                  kHight10,
                  TextFieldWidget(
                    userController: mobileController,
                    validator: (value) {
                      if (value!.length != 13) {
                        return 'Mobile Number must be of 13 digit with country code +91';
                      } else {
                        return null;
                      }
                    },
                    label: 'Phone Number:',
                    inputType: TextInputType.phone,
                    obscureText: false,
                  ),
                  kHight10,
                  TextFieldWidget(
                    userController: passwordController,
                    validator: (value) {
                      RegExp regex = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                      if (value!.isEmpty) {
                        return 'Please enter password';
                      } else {
                        if (!regex.hasMatch(value)) {
                          return 'Enter valid password';
                        } else {
                          return null;
                        }
                      }
                    },
                    label: 'Password:',
                    inputType: TextInputType.name,
                    obscureText: true,
                  ),
                  kHight10,
                  TextFieldWidget(
                    userController: rePassController,
                    validator: (value) {
                      if (value!.isEmpty) return 'Re-enter password';
                      if (value != passwordController.text) {
                        return 'Wrong password';
                      }
                    },
                    label: 'Re-enter Password:',
                    inputType: TextInputType.name,
                    obscureText: true,
                  ),
                  kHight20,
                  ButtonWidget(
                    width: width,
                    text: 'Sign Up',
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        final email = emailController.text;
                        final name = nameController.text;
                        final phone = mobileController.text;
                        final password = passwordController.text;
                        final rePassword = password;
                        final user = User(
                          name: name,
                          email: email,
                          phone: phone,
                          password: password,
                          rePassword: rePassword,
                        );
                        bool value = await ApiServices().signUp(user);
                        if (value) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ScreenOTP(),
                            ),
                          );
                        }
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
