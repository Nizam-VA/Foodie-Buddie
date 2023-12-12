import 'package:flutter/material.dart';
import 'package:foodiebuddie/model/dish.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    required this.width,
    required this.height,
    required this.dish,
  });

  final double width;
  final double height;
  final Dish dish;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height * .3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.green,
        image: DecorationImage(
          image: dish.imageUrl == ''
              ? const AssetImage('assets/images/categories/dish.jpg')
                  as ImageProvider
              : NetworkImage(dish.imageUrl),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
