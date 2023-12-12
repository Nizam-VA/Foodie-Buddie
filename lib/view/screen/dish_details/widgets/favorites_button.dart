import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddie/controller/blocs/favorites/favorites_bloc.dart';
import 'package:foodiebuddie/model/dish.dart';

class FavoritesButton extends StatelessWidget {
  const FavoritesButton({
    super.key,
    required this.dish,
  });

  final Dish dish;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        final dishIds = state.dishes.map((dish) => dish.dishId).toList();
        return CircleAvatar(
          radius: 25,
          child: CircleAvatar(
            radius: 24,
            backgroundColor:
                dishIds.contains(dish.dishId) ? Colors.green : Colors.white,
            child: IconButton(
              style: IconButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(width: 1, color: Colors.green),
                ),
              ),
              onPressed: () {
                context.read<FavoritesBloc>().add(
                      AddToFavoritesEvent(
                        dishId: dish.dishId,
                        context: context,
                      ),
                    );
              },
              icon: Icon(
                Icons.favorite,
                size: 30,
                color:
                    dishIds.contains(dish.dishId) ? Colors.white : Colors.green,
              ),
            ),
          ),
        );
      },
    );
  }
}
