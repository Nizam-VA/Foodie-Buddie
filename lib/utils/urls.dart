class ApiEndPoints {
  //IPAddress = 192.168.146.26
  //Local host = 10.0.2.2
  //http://ec2-16-170-237-67.eu-north-1.compute.amazonaws.com
  static const String baseUrl =
      'http://ec2-16-170-237-67.eu-north-1.compute.amazonaws.com';
  static const getDishesByCategory = '/dishes?l=10&category=';
  static const getDishesBySeller = '/dishes?seller=';
  static const searchDish = '/search/dishes?q=';
  static const getSellerById = '/user/sellers/';
  static const searchSeller = '/search/sellers?q=';
  static const addToCart = '/addToCart/';
  static const getAllCartItems = '/cart';
  static const getCategoryById = '/categories/';
  static const addToFavorites = '/addToFavourite/';
  static const getAllFavorites = '/favourites';
  static const addNewAddress = '/profile/addAddress';
  static const updateAddress = '/profile/address/';
  static const getAllAddresses = '/profile/address';
  static const getAllCoupons = '/coupons';
  static const getAvailableCoupons = '/coupons/available';
  static const getUserProfile = '/profile';
  static const updateUserProfile = '/profile/edit';
  static const checkOut = '/cart/checkout';
  static const getAllOrders = '/orders';
  static const verifyPayment = '/order/verifyPayment';
  static const getAllOffers = '/offers';
}
