import 'package:mabeet/core/api/api_constants.dart';
import 'package:mabeet/data/models/user_model.dart';

class SignUpModel {
  final String message;
  final UserModel user;

  SignUpModel({required this.message, required this.user});

  factory SignUpModel.fromJson(Map<String, dynamic> jsonData) {
    return SignUpModel(
      message: jsonData[ApiKey.message],
      user: jsonData[ApiKey.user],
    );
  }
}
