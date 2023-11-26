import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:foodiebuddie/controller/api_services/favorites/api_calls.dart';
import 'package:foodiebuddie/model/dish.dart';
import 'package:foodiebuddie/view/widgets/functions/snack_bar.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(FavoritesInitial()) {
    on<GetAllFavoritesEvent>((event, emit) async {
      List<Dish> dishes = await FavoriteApiServices().getAllFavorites();
      emit(FavoritesState(dishes: dishes, dishId: 0));
    });

    on<AddToFavoritesEvent>((event, emit) async {
      final value = await FavoriteApiServices().addToFavorites(event.dishId);

      if (value) {
        final dishes = await FavoriteApiServices().getAllFavorites();
        emit(FavoritesState(dishes: dishes, dishId: event.dishId));
        showSnack(event.context, Colors.green, 'Added to favorites.');
      } else {
        await FavoriteApiServices().deleteFromFovorites(event.dishId);
        final dishes = await FavoriteApiServices().getAllFavorites();
        emit(FavoritesState(dishes: dishes, dishId: event.dishId));
        showSnack(event.context, Colors.green, 'Deleted from favorites.');
      }
    });

    on<DeleteFromFavoritesEvent>((event, emit) async {
      final value =
          await FavoriteApiServices().deleteFromFovorites(event.dishId);

      if (value) {
        final dishes = await FavoriteApiServices().getAllFavorites();
        emit(FavoritesState(dishes: dishes, dishId: event.dishId));
        showSnack(event.context, Colors.green, 'Deleted from favorites.');
      } else {}
    });
  }
}
