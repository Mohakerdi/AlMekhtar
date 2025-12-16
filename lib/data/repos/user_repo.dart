import 'package:mabeet/core/api/api_consumer.dart';
import 'package:mabeet/core/errors/exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:mabeet/data/models/log_in_model.dart';
import 'package:mabeet/data/models/sign_up_model.dart';
import '../../core/api/api_constants.dart';

class UserRepository {
  final ApiConsumer api;

  UserRepository({required this.api});

  Future<Either<String, String>> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String passwordConfirmation,
  }) async {
    try {
      final response = await api.post(
        ApiConstants.create_account,
        data: {
          ApiKey.email: email,
          ApiKey.name: name,
          ApiKey.phone: phone,
          ApiKey.password: password,
          ApiKey.password_confirmation: passwordConfirmation,
        },
      );
      // final user = SignUpModel.fromJson(response);
      // final decodedToken = JwtDecoder.decode(user!.token);
      return Right('Success');
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  Future<Either<String, String>> logIn({
    required String phone,
    required String password,
  }) async {
    try {
      final response = await api.post(
        ApiConstants.login,
        data: {ApiKey.phone: phone, ApiKey.password: password},
      );
      // final model = LogInModel.fromJson(response);
      return Right('Success');
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }
}
