class ApiConstants {
  // Base URLs
  static const String BaseUrl = "http://10.0.2.2:8000/api/";
  static const String StorageBaseUrl = 'http://10.0.2.2:8000/storage/';

  // Authentication endpoints
  static const String login = 'login';
  static const String register = 'register';

  // User profile endpoints
  static const String createProfile = 'profile/store';
  static const String updateProfile = 'profile/update';
  static const String getUserProfile = 'profile';

  // Apartment-related endpoints
  static const String favorites = 'apartments/favorites';
  static const String filter = 'apartments/filter';

  // Notification endpoints
  static const String notifications = 'notifications';
}

class ApiKey {
  // API Response Keys
  static const String status = 'status';
  static const String message = 'message';
  static const String errorMessage = 'ErrorMessage';

  // Authentication Keys
  static const String token = 'token';
  static const String email = 'email';
  static const String password = 'password';
  static const String passwordConfirmation = 'password_confirmation';

  // User Data Keys
  static const String user = 'user';
  static const String id = 'id';
  static const String name = 'name';
  static const String firstName = 'firstName';
  static const String lastName = 'lastName';
  static const String phone = 'phone';
  static const String birthDate = 'birthDate';

  // Profile-related Keys
  static const String profile = 'profile';
  static const String avatar = 'avatar';
  static const String idPhoto = 'idPhoto';

  // Apartment/Property Keys
  static const String title = 'title';
  static const String description = 'description';
  static const String price = 'price';
  static const String area = 'area';
  static const String floor = 'floor';
  static const String rate = 'address_described';
  static const String propertyId = 'property_id';

  // Location Keys
  static const String city = 'enCity';
  static const String state = 'enState';
  static const String addressDescribed = 'address_described';

  // Filter Keys
  static const String minPrice = 'minPrice';
  static const String maxPrice = 'maxPrice';
  static const String minArea = 'minArea';
  static const String maxArea = 'maxArea';
  static const String minRate = 'minRate';
  static const String maxRate = 'maxRate';
  static const String order = 'order';


  // Media Keys
  static const String images = 'images';

  // Favorites/Preferences Keys
  static const String favourites = 'favourites';

  // Local Storage Keys (Non-API)
  static const String onBoardingSeen = 'onBoardingSeen';
}