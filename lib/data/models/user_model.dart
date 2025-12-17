import 'package:mabeet/core/api/api_constants.dart';

class UserModel {
  final String name;
  final String email;
  final String phone;
  final String id;

  UserModel({required this.name, required this.email, required this.phone, required this.id});

  UserModel copyWith({String? email, String? phone}) {
    return UserModel(
      name: name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      id: id
    );
  }
}
