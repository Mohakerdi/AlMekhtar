import 'package:mabeet/core/api/api_constants.dart';
import 'package:mabeet/data/models/user_model.dart';

class LogInModel {
  final String message;
  final String token;
  final String email;
  final String name;


  LogInModel({required this.message, required this.email, required this.token, required this.name});

  factory LogInModel.fromJson(Map<String, dynamic> jsonData) {

    final userJson = jsonData[ApiKey.user];

    return LogInModel(
      message: jsonData[ApiKey.message],
      email: userJson[ApiKey.email] ,
      name: userJson[ApiKey.name],
      token: jsonData[ApiKey.token]
    );
  }
}
