part of 'restaurant_bloc.dart';

class RestaurantState {
  final List<Seller> restaurants;
  RestaurantState({required this.restaurants});
}

final class RestaurantInitial extends RestaurantState {
  RestaurantInitial() : super(restaurants: []);
}
