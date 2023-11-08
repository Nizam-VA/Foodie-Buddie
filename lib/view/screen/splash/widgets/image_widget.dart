import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  ImageWidget({
    super.key,
    required this.width,
    required this.height,
    required this.position,
  });

  final double width;
  final double height;
  final images = [
    'assets/images/food-app.png',
    'assets/images/food.png',
    'assets/images/smartphone.png'
  ];
  final int position;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width - (width * .5),
      height: height * .25,
      child: Image.asset(
        images[position],
        fit: BoxFit.contain,
      ),
    );
  }
}
