part of 'restaurant_bloc.dart';

class RestaurantEvent {}

class SearchRestaurantEvent extends RestaurantEvent {
  final String query;
  SearchRestaurantEvent({required this.query});
}

class GetRestaurantByIdEvent extends RestaurantEvent {
  final int sellerId;
  GetRestaurantByIdEvent({required this.sellerId});
}
