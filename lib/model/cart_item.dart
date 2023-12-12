class CartItem {
  final int quantity;
  final int dishId;
  final int sellerId;
  final String name;
  final String description;
  final num price;
  final num salePrice;
  final String imageUrl;
  final int categoryId;
  final bool isVeg;
  final bool isAvailable;

  CartItem({
    required this.quantity,
    required this.dishId,
    required this.sellerId,
    required this.name,
    required this.description,
    required this.price,
    required this.salePrice,
    required this.imageUrl,
    required this.categoryId,
    required this.isVeg,
    required this.isAvailable,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      quantity: json['quantity'],
      dishId: json['dishId'],
      sellerId: json['sellerId'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      salePrice: json['salePrice'],
      imageUrl: json['imageUrl'],
      categoryId: json['categoryId'],
      isVeg: json['isVeg'],
      isAvailable: json['isAvailable'],
    );
  }

  Map<String, dynamic> toJson(CartItem cartItem) {
    final Map<String, dynamic> data = {
      'quantity': cartItem.quantity,
      'dishId': cartItem.dishId,
      'sellerId': cartItem.sellerId,
      'name': cartItem.name,
      'description': cartItem.description,
      'price': cartItem.price,
      'salePrice': cartItem.salePrice,
      'imageUrl': cartItem.imageUrl,
      'categoryId': cartItem.categoryId,
      'isVeg': cartItem.isVeg,
      'isAvailable': cartItem.isAvailable,
    };
    return data;
  }
}
