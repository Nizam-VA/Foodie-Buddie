class Dish {
  final int dishId;
  final int sellerId;
  final String name;
  final String description;
  final int price;
  final int salePrice;
  final String imageUrl;
  final int quantity;
  final int categoryId;
  final bool isVeg;
  final bool isAvailable;

  Dish({
    required this.dishId,
    required this.sellerId,
    required this.name,
    required this.description,
    required this.price,
    required this.salePrice,
    required this.imageUrl,
    required this.quantity,
    required this.categoryId,
    required this.isVeg,
    required this.isAvailable,
  });

  factory Dish.fromJson(Map<String, dynamic> json) {
    return Dish(
      dishId: json['dishId'],
      sellerId: json['sellerId'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      salePrice: json['salePrice'],
      imageUrl: json['imageUrl'],
      quantity: json['quantity'],
      categoryId: json['categoryId'],
      isVeg: json['isVeg'],
      isAvailable: json['isAvailable'],
    );
  }

  Map<String, dynamic> toJson(Dish dish) {
    final Map<String, dynamic> data = {
      'dishId': dish.dishId,
      'sellerId': dish.sellerId,
      'name': dish.name,
      'description': dish.description,
      'price': dish.price,
      'salePrice': dish.salePrice,
      'imageUrl': dish.imageUrl,
      'quantity': dish.quantity,
      'categoryId': dish.categoryId,
      'isVeg': dish.isVeg,
      'isAvailable': dish.isAvailable,
    };
    return data;
  }
}
