import 'package:flutter/material.dart';

class SubTitles extends StatelessWidget {
  SubTitles({super.key, required this.position});

  final int position;

  final subTitles = [
    "Browse through our extensive list of restaurants and dishes, and when you're ready to order, simply add your desired items to your cart and checkout. It's that easy!",
    'Get your favorite meals delivered to your doorstep for free with our online food delivery app - enjoy a whole month of complimentary delivery!',
    'Get your favorite meals delivered to your doorstep for free with our online food delivery app - enjoy a whole month of complimentary delivery!'
  ];

  @override
  Widget build(BuildContext context) {
    return Text(
      subTitles[position],
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 18,
      ),
    );
  }
}
