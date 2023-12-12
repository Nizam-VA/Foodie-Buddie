import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddie/controller/blocs/cart/cart_bloc.dart';
import 'package:foodiebuddie/model/dish.dart';
import 'package:foodiebuddie/view/screen/dish_details/widgets/favorites_button.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: width - 125,
          height: height * .075,
          child: ElevatedButton.icon(
            onPressed: () async {
              context
                  .read<CartBloc>()
                  .add(AddToCartEvent(dishId: dish.dishId, context: context));
            },
            icon: const Icon(Icons.shopping_bag),
            label: const Text('Add to bag'),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        FavoritesButton(dish: dish)
      ],
    );
  }
}
