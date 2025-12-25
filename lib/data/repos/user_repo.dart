import 'package:image_picker/image_picker.dart';
import 'package:mabeet/core/api/api_consumer.dart';
import 'package:mabeet/core/cache/cache_helper.dart';
import 'package:mabeet/core/errors/exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:mabeet/data/models/log_in_model.dart';
import 'package:mabeet/data/models/sign_up_model.dart';
import 'package:mabeet/data/models/user_model.dart';
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

      await CacheHelper.saveData(
        key: ApiKey.token,
        value: model.token,
      );

      return Right(model);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  Future<void> logout() async {
    await CacheHelper.removeData(key: ApiKey.token);
  }

  Future<Either<String, void>> createProfile({
    required String firstName,
    required String lastName,
    required String birthDate,
    required XFile avatarPic,
    required XFile idPhoto,
  }) async {
    try {
      final response = await api.post(
        ApiConstants.profile,
        data: {
          'avatar': avatarPic,
          'idPhoto': idPhoto,
          'firstName': firstName,
          'lastName': lastName,
          'birthDate': birthDate,
        },
      );

      return const Right(null);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  Future<Either<String, UserModel>> getUserProfile() async {
    try {
      final response = await api.get(
        ApiConstants.getUserProfile,
      );

      final user = UserModel.fromJson(response);
      return Right(user);
    } on ServerException catch (e) {
      if (e.errorModel.errorMessage.contains('Profile not found')) {
        return const Left('PROFILE_MISSING_ERROR');
      }
      return Left(e.errorModel.errorMessage);
    }
  }

}
