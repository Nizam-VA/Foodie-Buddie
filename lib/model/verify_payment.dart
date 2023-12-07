class VerifyPayment {
  final String razorpayOrderId;
  final String razorpayPaymentId;
  final String razorpaySignature;

  VerifyPayment({
    required this.razorpayOrderId,
    required this.razorpayPaymentId,
    required this.razorpaySignature,
  });

  Map<String, dynamic> toJson(VerifyPayment verifyPayment) {
    final Map<String, dynamic> data = {
      'razorpay_order_id': verifyPayment.razorpayOrderId,
      'razorpay_payment_id': verifyPayment.razorpayPaymentId,
      'razorpay_signature': verifyPayment.razorpaySignature,
    };
    return data;
  }
}
