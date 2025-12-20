import 'package:dartz/dartz.dart';
import 'package:mabeet/core/api/api_consumer.dart'; // Assuming this provides HTTP capabilities
import 'package:mabeet/core/errors/exceptions.dart'; // Assuming this defines ServerException
import 'package:mabeet/data/models/property.dart';
import 'package:mabeet/data/models/search_model.dart';
import 'package:mabeet/data/models/state.dart';
class SearchRepository {
  final ApiConsumer api;
  SearchRepository({required this.api});

  Future<Either<String, List<Property>>> getFilteredResults({
    Location? governorate,
    String? area,
    double? minCost,
    double? maxCost,
    double? minArea,
    double? maxArea,
    double? minRate,
    double? maxRate,
    String? order,
  }) async {
    try {
      final data = {
        'enState': governorate?.name,
        'enCity': area,
        'minPrice': minCost,
        'maxPrice': maxCost,
        'minArea': minArea,
        'maxArea': maxArea,
        'minRate': minRate,
        'maxRate': maxRate,
        'order': order,
      };

      final response = await api.get(
        '/apartments/filter',
        queryParameters: data,
      );

      final filterResponse = SearchModel.fromJson(response);

      final List<Property> results = filterResponse.data;

      return Right(results);

    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    } catch (e) {
      return Left('An unexpected error occurred: ${e.toString()}');
    }
  }
}