part of 'dish_bloc.dart';

class DishEvent {}

final class GetDishByCategory extends DishEvent {
  final int categoryId;
  GetDishByCategory({required this.categoryId});
}

final class GetDishBySeller extends DishEvent {
  final int sellerId;
  GetDishBySeller({required this.sellerId});
}

final class GetDishBySellerAndCategory extends DishEvent {
  final int sellerId;
  final int categoryId;
  GetDishBySellerAndCategory(
      {required this.sellerId, required this.categoryId});
}

final class SearchDishEvent extends DishEvent {
  final String query;
  SearchDishEvent({required this.query});
}
