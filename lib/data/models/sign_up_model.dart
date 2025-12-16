import 'package:mabeet/core/api/api_constants.dart';
import 'package:mabeet/data/models/user_model.dart';

class SignUpModel {
  final String message;
  final String name;
  final String email;
  final String phone;
  final int id;

  SignUpModel({
    required this.message,
    required this.name,
    required this.email,
    required this.phone,
    required this.id,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> jsonData) {

    final userJson = jsonData[ApiKey.user];

    return SignUpModel(
      message: jsonData[ApiKey.message],
      name: userJson[ApiKey.name],
      email: userJson[ApiKey.email],
      phone: userJson[ApiKey.phone],
      id: userJson[ApiKey.id],
    );
  }
}
