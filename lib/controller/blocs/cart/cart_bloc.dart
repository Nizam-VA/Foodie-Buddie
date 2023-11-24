import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:foodiebuddie/controller/api_services/cart/api_calls.dart';
import 'package:foodiebuddie/model/cart_item.dart';
import 'package:foodiebuddie/view/widgets/functions/snack_bar.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<GetAllCartItemsEvent>((event, emit) async {
      List<CartItem> cartItems = await CartApiServices().getAllCartItems();
      emit(GetAllCartItemsState(cartItems: cartItems));
    });

    on<AddToCartEvent>((event, emit) async {
      final value = await CartApiServices().addToCart(event.dishId);
      final cartItems = await CartApiServices().getAllCartItems();
      if (value) {
        showSnack(event.context, Colors.green, 'Added to cart');
        emit(GetAllCartItemsState(cartItems: cartItems));
      } else {
        showSnack(
            event.context, Colors.red, 'Select dish from same resturant.');
      }
    });
  }
}
