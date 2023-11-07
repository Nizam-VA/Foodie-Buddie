import 'package:flutter/material.dart';
import 'package:foodiebuddie/core/constants.dart';
import 'package:foodiebuddie/view/widgets/button_widget.dart';
import 'package:foodiebuddie/view/widgets/text_button_widget.dart';

class ScreenOTP extends StatelessWidget {
  ScreenOTP({super.key});

  List<TextEditingController> controllers =
      List.generate(6, (index) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());

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
              'Verify phone number',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            kHight10,
            Text(
              'We have sent you a 6 digit code. Please enter here to verify your number.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            kHight20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) {
                return Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: width * .05),
                      alignment: Alignment.center,
                      width: width * .125,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: controllers[index],
                        focusNode: focusNodes[index],
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            if (index < 5) {
                              FocusScope.of(context)
                                  .requestFocus(focusNodes[index + 1]);
                            }
                          }
                        },
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                      ),
                    ),
                  ],
                );
              }),
            ),
            TextButtonWidget(
              width: width,
              text: 'Didn’t get the code? Resend code',
              onPressed: () {},
            ),
            kHight20,
            Container(
              alignment: Alignment.center,
              child: ButtonWidget(
                width: width,
                text: 'Verify',
                onPressed: () {},
              ),
            )
          ],
        ),
      )),
    );
  }
}
