import 'package:mabeet/core/api/api_consumer.dart';
import 'package:mabeet/core/errors/exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:mabeet/data/models/log_in_model.dart';
import 'package:mabeet/data/models/sign_up_model.dart';
import '../../core/api/api_constants.dart';

class UserRepository {
  final ApiConsumer api;

  UserRepository({required this.api});

  Future<Either<String, SignUpModel>> signUp({
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
      final user = SignUpModel.fromJson(response);
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  Future<Either<String, LogInModel>> logIn({
    required String credential,
    required String password,
  }) async {
    try {
      String credType = ApiKey.phone;
      if (credential.contains('@'))credType = ApiKey.email;

      final response = await api.post(
        ApiConstants.login,
        data: {credType: credential, ApiKey.password: password},
      );

      final model = LogInModel.fromJson(response);
      // add cache helper to save token
      return Right(model);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }
}
