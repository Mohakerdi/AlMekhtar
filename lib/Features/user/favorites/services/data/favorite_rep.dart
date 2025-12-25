import 'package:mabeet/Features/user/favorites/services/data/favorite_webservices.dart';
import 'package:mabeet/data/models/property.dart';

class FavoriteRepository {
  final FavoriteWebServices webServices;
  FavoriteRepository(this.webServices);

  Future<List<Property>> fetchFavorites() async {
    print(" 2. Repo: Calling WebServices...");
    final response = await webServices.getFavorites();
    print("3. Repo: Raw Response: $response");
    List<dynamic> data = response['favourites'] ?? [];
    return data.map((json) => Property.fromJson(json)).toList();
  }

  Future<void> addFavorite(int propertyId) async {
    await webServices.addFavorite(propertyId);
  }

  Future<void> deleteFavorite(int propertyId) async {
    await webServices.deleteFavorite(propertyId);
  }
}
