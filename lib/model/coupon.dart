class Coupon {
  final int couponId;
  final String couponCode;
  final String description;
  final String couponType;
  final int discount;
  final int minimumAmtRequired;
  final int maximumAmtAllowed;
  final String startDate;
  final String endDate;
  final String status;

  Coupon({
    required this.couponId,
    required this.couponCode,
    required this.description,
    required this.couponType,
    required this.discount,
    required this.minimumAmtRequired,
    required this.maximumAmtAllowed,
    required this.startDate,
    required this.endDate,
    required this.status,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) {
    return Coupon(
      couponId: json['couponId'],
      couponCode: json['couponCode'],
      description: json['description'],
      couponType: json['couponType'],
      discount: json['discount'],
      minimumAmtRequired: json['minimumAmtRequired'],
      maximumAmtAllowed: json['maximumAmtAllowed'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson(Coupon coupon) {
    final Map<String, dynamic> data = {
      'couponId': coupon.couponId,
      'couponCode': coupon.couponCode,
      'description': coupon.description,
      'couponType': coupon.couponType,
      'discount': coupon.discount,
      'minimumAmtRequired': coupon.minimumAmtRequired,
      'maximumAmtAllowed': coupon.maximumAmtAllowed,
      'startDate': coupon.startDate,
      'endDate': coupon.endDate,
      'status': coupon.status,
    };

    return data;
  }
}
