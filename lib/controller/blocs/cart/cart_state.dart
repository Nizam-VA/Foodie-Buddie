part of 'cart_bloc.dart';

class CartState {}

final class CartInitial extends CartState {}

final class GetAllCartItemsState extends CartState {
  final List<CartItem> cartItems;
  GetAllCartItemsState({required this.cartItems});
}

final class AddToCartState extends CartState {}
