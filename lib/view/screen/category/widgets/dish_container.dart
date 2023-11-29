import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddie/controller/blocs/favorites/favorites_bloc.dart';
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
    context.read<FavoritesBloc>().add(GetAllFavoritesEvent());
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(6),
      width: width - (width * .8),
      // height: height * .275,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: Colors.green),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: height * .15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Colors.green),
                  image: DecorationImage(
                    image: dish.imageUrl == ''
                        ? const AssetImage('assets/images/categories/dish.jpg')
                            as ImageProvider
                        : NetworkImage(dish.imageUrl),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          kHight10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // const CircleAvatar(
              //   radius: 18,
              //   backgroundColor: Colors.white,
              //   backgroundImage:
              //       AssetImage('assets/images/icons/restaurant.png'),
              // ),
              // kWidth10,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(dish.name), Text('₹ ${dish.price}')],
              ),
              BlocBuilder<FavoritesBloc, FavoritesState>(
                builder: (context, state) {
                  final dishIds =
                      state.dishes.map((dish) => dish.dishId).toList();
                  return CircleAvatar(
                    radius: 18,
                    backgroundColor: dishIds.contains(dish.dishId)
                        ? Colors.red
                        : Colors.white,
                    child: IconButton(
                      onPressed: () async {
                        context.read<FavoritesBloc>().add(
                              AddToFavoritesEvent(
                                dishId: dish.dishId,
                                context: context,
                              ),
                            );
                      },
                      icon: Icon(
                        Icons.favorite,
                        size: 22,
                        color: dishIds.contains(dish.dishId)
                            ? Colors.white
                            : Colors.red,
                      ),
                    ),
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
