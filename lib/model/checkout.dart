class CheckOut {
  final String addressId;
  final String couponCode;
  final String paymentMethod;

  CheckOut({
    required this.addressId,
    required this.couponCode,
    required this.paymentMethod,
  });

  Map<String, dynamic> toJson(CheckOut checkOut) {
    final data = {
      'addressId': checkOut.addressId,
      'couponCode': checkOut.couponCode,
      'paymentMethod': checkOut.paymentMethod,
    };
    return data;
  }
}
