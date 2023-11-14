import 'package:flutter/material.dart';
import 'package:foodiebuddie/utils/constants.dart';

class ProductListWidget extends StatelessWidget {
  ProductListWidget({
    super.key,
    required this.height,
    required this.width,
    required this.count,
  });

  final List<String> images = [
    'assets/images/dishes/burger.jpg',
    'assets/images/dishes/kfc.jpg'
  ];
  final List<String> logos = [
    'assets/logo/restaurants/curry.png',
    'assets/logo/restaurants/kfc.png'
  ];

  final double height;
  final double width;
  final int count;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * .275,
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
                    height: height * .175,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: .5),
                        image: DecorationImage(
                            image: AssetImage(
                                index % 2 == 0 ? images[0] : images[1]),
                            fit: BoxFit.cover)),
                  ),
                  kHight10,
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.white,
                        backgroundImage:
                            AssetImage(index % 2 == 0 ? logos[0] : logos[1]),
                      ),
                      kWidth10,
                      const Column(
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
