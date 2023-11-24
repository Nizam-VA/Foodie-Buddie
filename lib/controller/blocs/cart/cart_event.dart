part of 'cart_bloc.dart';

class CartEvent {}

class GetAllCartItemsEvent extends CartEvent {}

class AddToCartEvent extends CartEvent {
  final int dishId;
  final BuildContext context;
  AddToCartEvent({required this.dishId, required this.context});
}
