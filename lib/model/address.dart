class Address {
  final int addressId;
  final int userId;
  final String district;
  final String houseName;
  final String name;
  final String phone;
  final String pinCode;
  final String state = 'Kerala';
  final String street;

  Address({
    required this.addressId,
    required this.userId,
    required this.district,
    required this.houseName,
    required this.name,
    required this.phone,
    required this.pinCode,
    required this.street,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      addressId: json['addressId'],
      userId: json['userId'],
      district: json['district'],
      houseName: json['houseName'],
      name: json['name'],
      phone: json['phone'],
      pinCode: json['pinCode'],
      street: json['street'],
    );
  }

  Map<String, dynamic> toJson(Address address) {
    final Map<String, dynamic> data = {
      'district': address.district,
      'houseName': address.houseName,
      'name': address.name,
      'phone': address.phone,
      'pinCode': address.pinCode,
      'state': 'Kerala',
      'street': address.street,
    };
    return data;
  }
}
