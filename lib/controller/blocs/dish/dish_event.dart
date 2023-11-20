part of 'dish_bloc.dart';

class DishEvent {}

final class GetDishByCategory extends DishEvent {
  final int categoryId;
  GetDishByCategory({required this.categoryId});
}
