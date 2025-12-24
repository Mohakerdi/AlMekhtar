import 'package:mabeet/core/api/api_constants.dart';
import 'package:mabeet/core/api/api_consumer.dart';

class FavoriteWebServices {
  final ApiConsumer api;
  FavoriteWebServices({required this.api});

  Future<dynamic> getFavorites() async {
    return await api.get(ApiConstants.favorites);
  }

  Future<dynamic> addFavorite(int id) async {
    return await api.post('apartments/$id/favorites');
  }

  Future<dynamic> deleteFavorite(int id) async {
    return await api.delete('apartments/$id/favorites');
  }
}
