import 'package:dartz/dartz.dart';
import 'package:mabeet/core/api/api_consumer.dart';
import 'package:mabeet/core/errors/exceptions.dart';
import 'package:mabeet/core/api/api_constants.dart';

class PaymentRepository {
  PaymentRepository({required this.api});
  final ApiConsumer api;

  Future<Either<String, String>> offer({
    required int apartmentId,
    required String startTerm,
    required String endTerm,
    required String cardNumber,
    required String cvv,
  }) async {
    try {
      final path = '${ApiConstants.apartment}/$apartmentId/${ApiConstants.offer}';
      final queryParams = {
        'startTerm': startTerm,
        'endTerm': endTerm,
        'cardNumber': int.parse(cardNumber),
        'cvv': int.parse(cvv),
      };

      final response = await api.post(
        path,
        queryParameters: queryParams,
        isFormData: false,
        data: null,
      );

      final message = response.data['message'] as String;

      return Right(message);

    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    } catch (e) {
      return Left('Offer request failed: ${e.toString()}');
    }
  }

}