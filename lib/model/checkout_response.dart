class CheckoutResponse {
  final int deliveryCharge;
  final String email;
  final String firstName;
  final String key;
  final String orderId;
  final String phone;
  final int totalPrice;

  CheckoutResponse({
    required this.deliveryCharge,
    required this.email,
    required this.firstName,
    required this.key,
    required this.orderId,
    required this.phone,
    required this.totalPrice,
  });

  factory CheckoutResponse.fromJson(Map<String, dynamic> json) {
    return CheckoutResponse(
      deliveryCharge: json['deliveryCharge'],
      email: json['email'],
      firstName: json['firstName'],
      key: json['key'],
      orderId: json['orderId'],
      phone: json['phone'],
      totalPrice: json['totalPrice'],
    );
  }

  Map<String, dynamic> toJson(CheckoutResponse response) {
    final Map<String, dynamic> data = {
      'deliveryCharge': response.deliveryCharge,
      'email': response.email,
      'firstName': response.firstName,
      'key': response.key,
      'orderId': response.orderId,
      'phone': response.phone,
      'totalPrice': response.totalPrice,
    };

    return data;
  }
}
