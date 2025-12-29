import 'package:mabeet/core/api/api_constants.dart';

class ProfileModel {
  final int id;
  final String firstName;
  final String lastName;
  final String? avatarUrl;
  final String? idPhotoUrl;
  final String? birthDate;

  ProfileModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.avatarUrl,
    this.idPhotoUrl,
    this.birthDate,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    final profileData = json['profile'] as Map<String, dynamic>;

    final avatarPath = profileData['avatar'] as String?;
    final idPhotoPath = profileData['idPhoto'] as String?;

    String? getFullImageUrl(String? path) {
      if (path == null || path.isEmpty) return null;
      return '${ApiConstants.StorageBaseUrl}$path';
    }

    return ProfileModel(
      id: profileData['id'] as int,
      firstName: profileData['firstName'] as String,
      lastName: profileData['lastName'] as String,
      avatarUrl: getFullImageUrl(avatarPath),
      idPhotoUrl: getFullImageUrl(idPhotoPath),
      birthDate: profileData['birthDate'] as String?,
    );
  }
}