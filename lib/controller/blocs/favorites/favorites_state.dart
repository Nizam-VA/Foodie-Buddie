part of 'favorites_bloc.dart';

class FavoritesState {
  final List<Dish> dishes;
  final int dishId;
  FavoritesState({required this.dishes, required this.dishId});
}

final class FavoritesInitial extends FavoritesState {
  FavoritesInitial() : super(dishes: [], dishId: 0);
}
