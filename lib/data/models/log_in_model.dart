import 'package:mabeet/core/api/api_constants.dart';
import 'package:mabeet/data/models/user_model.dart';

class LogInModel {
  final String message;
  final UserModel user;

  LogInModel({required this.message, required this.user});

  factory LogInModel.fromJson(Map<String, dynamic> jsonData) {
    return LogInModel(
      message: jsonData[ApiKey.message],
      user: jsonData[ApiKey.user],
    );
  }
}
