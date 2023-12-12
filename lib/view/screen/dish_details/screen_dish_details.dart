import 'package:flutter/material.dart';
import 'package:foodiebuddie/model/dish.dart';
import 'package:foodiebuddie/model/seller.dart';
import 'package:foodiebuddie/utils/constants.dart';
import 'package:foodiebuddie/view/screen/dish_details/widgets/add_to_cart.dart';
import 'package:foodiebuddie/view/screen/dish_details/widgets/image_container.dart';
import 'package:foodiebuddie/view/screen/dish_details/widgets/restaurant_banner.dart';
import 'package:foodiebuddie/view/screen/home/widgets/section_head.dart';
import 'package:foodiebuddie/view/widgets/app_bar.dart';

class ScreenDishDetails extends StatelessWidget {
  ScreenDishDetails({super.key, required this.dish, required this.seller});
  final Dish dish;
  final Seller seller;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBarWidget(title: dish.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageContainer(width: width, height: height, dish: dish),
                kHight20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SectionHead(heading: dish.name),
                    SectionHead(heading: '₹ ${dish.price}')
                  ],
                ),
                kHight20,
                RestaurantBanner(seller: seller),
                kHight20,
                Text(dish.description),
              ],
            ),
            AddToCartButton(width: width, height: height, dish: dish),
          ],
        ),
      ),
    );
  }
}
