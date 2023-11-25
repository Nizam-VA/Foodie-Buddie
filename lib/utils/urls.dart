class ApiEndPoints {
  static const String baseUrl = 'http://10.0.2.2:8080';
  static const getDishesByCategory = '/dishes?l=10&category=';
  static const getDishesBySeller = '/dishes?seller=';
  static const getSellerById = '/user/sellers/';
  static const addToCart = '/addToCart/';
  static const getAllCartItems = '/cart';
  static const getCategoryById = '/categories/';
  static const addToFavorites = '/addToFavourite/';
  static const getAllFavorites = '/favourites';
  static const addNewAddress = '/profile/addAddress';
  static const updateAddress = '/profile/address/';
  static const getAllAddresses = '/profile/address';
}
