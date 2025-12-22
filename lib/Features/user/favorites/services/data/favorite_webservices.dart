import 'package:mabeet/core/api/api_constants.dart';
import 'package:mabeet/core/api/api_consumer.dart';

class FavoriteWebServices {
  final ApiConsumer api;
  FavoriteWebServices({required this.api});

  Future<dynamic> getFavorites() async {
    return await api.get(ApiConstants.favorites);
  }

  Future<dynamic> toggleFavorite(String id) async {
    return await api.post(
      ApiConstants.favorites,
      data: {ApiKey.propertyId: id},
    );
  }
}
