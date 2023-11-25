part of 'favorites_bloc.dart';

class FavoritesState {
  final List<Dish> dishes;
  FavoritesState({required this.dishes});
}

final class FavoritesInitial extends FavoritesState {
  FavoritesInitial() : super(dishes: []);
}
