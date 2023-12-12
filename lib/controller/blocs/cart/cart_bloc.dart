import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:foodiebuddie/controller/api_services/cart/api_calls.dart';
import 'package:foodiebuddie/controller/api_services/checkout/api_calls.dart';
import 'package:foodiebuddie/controller/api_services/coupon/api_calls.dart';
import 'package:foodiebuddie/model/cart_item.dart';
import 'package:foodiebuddie/model/checkout.dart';
import 'package:foodiebuddie/model/coupon.dart';
import 'package:foodiebuddie/view/screen/main/screen_main.dart';
import 'package:foodiebuddie/view/screen/payment/screen_payment.dart';
import 'package:foodiebuddie/view/widgets/functions/snack_bar.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  int discount = 0;
  CartBloc() : super(CartInitial()) {
    on<GetAllCartItemsEvent>((event, emit) async {
      List<CartItem> cartItems = await CartApiServices().getAllCartItems();
      final total = sum(cartItems);
      emit(GetAllCartItemsState(
          cartItems: cartItems,
          total: total,
          discount: discount,
          couponCode: ''));
    });

    on<AddToCartEvent>((event, emit) async {
      final value = await CartApiServices().addToCart(event.dishId);
      final cartItems = await CartApiServices().getAllCartItems();
      final total = sum(cartItems);
      if (value) {
        showSnack(event.context, Colors.green, 'Added to cart');
        emit(GetAllCartItemsState(
            cartItems: cartItems,
            total: total,
            discount: discount,
            couponCode: ''));
      } else {
        showSnack(
            event.context, Colors.red, 'Select dish from same resturant.');
      }
    });

    on<DecreaseCartEvent>((event, emit) async {
      final value = await CartApiServices().decreaseFromCart(event.dishId);
      final cartItems = await CartApiServices().getAllCartItems();
      int total = sum(cartItems);
      if (value) {
        showSnack(event.context, Colors.green, 'Decreased from cart');
        emit(GetAllCartItemsState(
            cartItems: cartItems,
            total: total,
            discount: discount,
            couponCode: ''));
      } else {
        showSnack(
            event.context, Colors.red, 'Choose dish from same resturant.');
      }
    });

    on<DeleteItemFromCartEvent>((event, emit) async {
      final value = await CartApiServices().deleteItemFromCart(event.dishId);
      final cartItems = await CartApiServices().getAllCartItems();
      int total = sum(cartItems);
      if (value) {
        showSnack(event.context, Colors.green, 'Decreased from cart');
        emit(GetAllCartItemsState(
            cartItems: cartItems,
            total: total,
            discount: discount,
            couponCode: ''));
      } else {
        showSnack(
            event.context, Colors.red, 'Select dish from same resturant.');
      }
    });

    on<GetAllCouponsEvent>((event, emit) async {
      final coupons = await CouponApiServices().getAllCoupons();
      final cartItems = await CartApiServices().getAllCartItems();
      int total = sum(cartItems);
      emit(GetAllCouponsState(coupons: coupons));
      emit(GetAllCartItemsState(
          cartItems: cartItems,
          total: total,
          discount: discount,
          couponCode: ''));
    });

    on<GetAvailableCouponsEvent>((event, emit) async {
      final coupons = await CouponApiServices().getAvailableCoupons();
      final cartItems = await CartApiServices().getAllCartItems();
      int total = sum(cartItems);
      emit(GetAllCouponsState(coupons: coupons));
      emit(GetAllCartItemsState(
        cartItems: cartItems,
        total: total,
        discount: discount,
        couponCode: '',
      ));
    });

    on<RedeemCouponEvent>((event, emit) async {
      final coupons = await CouponApiServices().getAvailableCoupons();
      final cartItems = await CartApiServices().getAllCartItems();
      int total = sum(cartItems);
      if (event.coupon.minimumAmtRequired < total) {
        discount = event.coupon.discount;
        emit(GetAllCouponsState(coupons: coupons));
        emit(GetAllCartItemsState(
          cartItems: cartItems,
          total: total,
          discount: discount,
          couponCode: event.coupon.couponCode,
        ));
      }
    });

    on<CheckoutEvent>((event, emit) async {
      final value = await CheckOutApiServices().checkout(event.checkOut);
      if (value == null) {
        showSnack(event.context, Colors.green, 'Order Placed Successfully.');
        Navigator.of(event.context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => ScreenMain()),
            (route) => false);
      } else {
        Navigator.of(event.context).push(
          MaterialPageRoute(
            builder: (context) => ScreenPayment(response: value),
          ),
        );
      }
    });
  }

  int sum(List<CartItem> cartItems) {
    int total = 0;
    for (int i = 0; i < cartItems.length; i++) {
      total += cartItems[i].price.round() * cartItems[i].quantity;
    }
    return total;
  }
}
