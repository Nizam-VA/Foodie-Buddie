class Seller {
  final int id;
  final String name;
  final String description;
  final String email;
  final String pinCode;

  Seller({
    required this.id,
    required this.name,
    required this.description,
    required this.email,
    required this.pinCode,
  });

  factory Seller.fromJson(Map<String, dynamic> json) {
    return Seller(
      id: json['sellerId'],
      name: json['name'],
      description: json['description'],
      email: json['email'],
      pinCode: json['pinCode'],
    );
  }
}
