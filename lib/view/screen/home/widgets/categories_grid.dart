import 'package:flutter/material.dart';

class CategoriesGridview extends StatelessWidget {
  CategoriesGridview({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;
  final List<String> images = [
    'assets/images/categories/burger.png',
    'assets/images/categories/fried-rice.png',
    'assets/images/categories/chinese-food.png',
    'assets/images/categories/ladoo.png',
    'assets/images/categories/drink.png',
    'assets/images/categories/all.png',
  ];
  final List<String> categories = [
    'Burger',
    'Biriyani',
    'Chinese',
    'Sweets',
    'Drinks',
    'View All',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * .35,
      child: Expanded(
        child: GridView.builder(
            itemCount: 6,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (context, index) {
              return Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      images[index],
                      width: width * .1,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      categories[index],
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
