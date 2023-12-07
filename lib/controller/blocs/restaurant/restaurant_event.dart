part of 'restaurant_bloc.dart';

class RestaurantEvent {}

class SearchRestaurantEvent extends RestaurantEvent {
  final String query;
  SearchRestaurantEvent({required this.query});
}
