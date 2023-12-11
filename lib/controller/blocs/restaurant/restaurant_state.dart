part of 'restaurant_bloc.dart';

class RestaurantState {
  final List<Seller> restaurants;
  final Seller? seller;
  RestaurantState({required this.restaurants, this.seller});
}

final class RestaurantInitial extends RestaurantState {
  RestaurantInitial() : super(restaurants: []);
}
