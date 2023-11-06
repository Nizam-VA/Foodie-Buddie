import 'package:flutter/material.dart';
import 'package:foodiebuddie/core/constants.dart';
import 'package:foodiebuddie/view/screen/splash/widgets/next_button.dart';
import 'package:foodiebuddie/view/screen/splash/widgets/screen_indicator.dart';
import 'package:foodiebuddie/view/screen/splash/widgets/sub_titles.dart';
import 'package:foodiebuddie/view/screen/splash/widgets/titles.dart';

class ScreenSplash extends StatelessWidget {
  ScreenSplash({super.key});
  final images = [
    'assets/images/food-app.png',
    'assets/images/food.png',
    'assets/images/smartphone.png'
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: PageView.builder(
        itemBuilder: (context, position) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              children: [
                kHight100,
                SizedBox(
                  width: width,
                  height: height * .35,
                  child: Image.asset(
                    images[position],
                    fit: BoxFit.contain,
                  ),
                ),
                kHight20,
                ScreenIndicator(position: position),
                kHight20,
                Titles(position: position),
                kHight20,
                SubTitles(position: position),
                kHight50,
                NextButton(width: width, position: position)
              ],
            ),
          );
        },
        itemCount: 3,
      ),
    );
  }
}
