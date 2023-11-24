import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddie/controller/blocs/cart/cart_bloc.dart';
import 'package:foodiebuddie/model/dish.dart';
import 'package:foodiebuddie/model/seller.dart';
import 'package:foodiebuddie/utils/constants.dart';
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
                Container(
                  width: width,
                  height: height * .3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green,
                    image: DecorationImage(
                      image: dish.imageUrl == ''
                          ? const AssetImage(
                                  'assets/images/categories/dish.jpg')
                              as ImageProvider
                          : NetworkImage(dish.imageUrl),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                kHight20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SectionHead(heading: dish.name),
                    SectionHead(heading: '₹ ${dish.price}')
                  ],
                ),
                kHight20,
                Row(
                  children: [
                    CircleAvatar(
                      radius: 31,
                      backgroundColor: Colors.green,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Image.asset(
                          'assets/images/icons/restaurant.png',
                          height: 36,
                        ),
                      ),
                    ),
                    kWidth10,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionHead(heading: seller.name),
                        Text(seller.description)
                      ],
                    ),
                  ],
                ),
                kHight20,
                Text(dish.description),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width - 125,
                  height: height * .075,
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      context.read<CartBloc>().add(AddToCartEvent(
                          dishId: dish.dishId, context: context));
                    },
                    icon: const Icon(Icons.shopping_bag),
                    label: const Text('Add to bag'),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                IconButton(
                    style: IconButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(width: 1, color: Colors.green)),
                    ),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                      size: 30,
                      color: Colors.green,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
