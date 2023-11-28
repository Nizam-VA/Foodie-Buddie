part of 'cart_bloc.dart';

class CartEvent {}

class GetAllCartItemsEvent extends CartEvent {}

class AddToCartEvent extends CartEvent {
  final int dishId;
  final BuildContext context;
  AddToCartEvent({required this.dishId, required this.context});
}

class DecreaseCartEvent extends CartEvent {
  final int dishId;
  final BuildContext context;
  DecreaseCartEvent({required this.dishId, required this.context});
}

class DeleteItemFromCartEvent extends CartEvent {
  final int dishId;
  final BuildContext context;
  DeleteItemFromCartEvent({required this.dishId, required this.context});
}

class AddTipEvent extends CartEvent {
  final int tip;
  AddTipEvent({required this.tip});
}

class GetAllCouponsEvent extends CartEvent {}

class GetAvailableCouponsEvent extends CartEvent {}

class RedeemCouponEvent extends CartEvent {
  final Coupon coupon;
  RedeemCouponEvent({required this.coupon});
}
