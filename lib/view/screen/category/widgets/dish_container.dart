import 'package:flutter/material.dart';
import 'package:foodiebuddie/model/dish.dart';
import 'package:foodiebuddie/utils/constants.dart';

ValueNotifier<List<int>> favoriteNotifier = ValueNotifier<List<int>>([]);

class DishContainer extends StatelessWidget {
  const DishContainer(
      {super.key,
      required this.width,
      required this.height,
      required this.dish});

  final double width;
  final double height;
  final Dish dish;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      width: width - (width * .8),
      height: height * .275,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: .5),
      ),
      child: Column(
        children: [
          SizedBox(
            child: Stack(
              children: [
                Container(
                  height: height * .2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // border: Border.all(width: .5),
                      image: DecorationImage(
                          image: dish.imageUrl == ''
                              ? const AssetImage(
                                      'assets/images/categories/dish.jpg')
                                  as ImageProvider
                              : NetworkImage(dish.imageUrl),
                          fit: BoxFit.fill)),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: ValueListenableBuilder(
                      valueListenable: favoriteNotifier,
                      builder: (context, favorite, child) {
                        return IconButton(
                          onPressed: favToggler,
                          icon: Icon(
                            Icons.favorite,
                            size: 26,
                            color: favorite.contains(dish.dishId)
                                ? Colors.red
                                : Colors.green,
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          kHight10,
          Row(
            children: [
              const CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                backgroundImage:
                    AssetImage('assets/images/icons/restaurant.png'),
              ),
              kWidth10,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(dish.name), Text('₹ ${dish.price}')],
              )
            ],
          )
        ],
      ),
    );
  }

  favToggler() {
    favoriteNotifier.value.contains(dish.dishId)
        ? favoriteNotifier.value.add(dish.dishId)
        : favoriteNotifier.value.remove(dish.dishId);
  }
}
