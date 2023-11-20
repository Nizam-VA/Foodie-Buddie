part of 'dish_bloc.dart';

class DishState {
  final bool isLoading;
  final List<Dish> dishes;
  DishState({required this.isLoading, required this.dishes});
}

final class DishInitial extends DishState {
  DishInitial() : super(isLoading: true, dishes: []);
}
