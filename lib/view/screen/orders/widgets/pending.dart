import 'package:flutter/material.dart';

class Pending extends StatelessWidget {
  const Pending({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(24),
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Container(
            width: width,
            height: height * .25,
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.green),
            ),
          );
        },
      ),
    );
  }
}
