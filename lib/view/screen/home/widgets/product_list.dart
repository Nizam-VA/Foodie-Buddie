import 'package:flutter/material.dart';
import 'package:foodiebuddie/core/constants.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({
    super.key,
    required this.height,
    required this.width,
    required this.count,
  });

  final double height;
  final double width;
  final int count;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * .25,
      child: Expanded(
        child: ListView.builder(
          itemCount: count,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(right: 12, top: 8),
              width: width - (width * .4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: .5),
              ),
              child: Column(
                children: [
                  Container(
                    height: height * .15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: .5),
                    ),
                  ),
                  kHight10,
                  const Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                      ),
                      kWidth10,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text('Hotel name'), Text('Place of hotel')],
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
