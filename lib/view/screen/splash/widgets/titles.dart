import 'package:flutter/material.dart';

class Titles extends StatelessWidget {
  Titles({super.key, required this.position});

  final int position;
  final titles = [
    'Wide range of Food Categories & more',
    'Free Deliveries for One Month!',
    'Get started on Ordering your Food'
  ];

  @override
  Widget build(BuildContext context) {
    return Text(
      titles[position],
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
