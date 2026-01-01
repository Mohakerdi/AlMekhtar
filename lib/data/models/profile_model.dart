import 'package:mabeet/core/api/api_constants.dart';

class ProfileModel {
  final String firstName;
  final String lastName;
  final String? avatarUrl;
  final String? idPhotoUrl;
  final String? birthDate;

  ProfileModel({
    required this.firstName,
    required this.lastName,
    this.avatarUrl,
    this.idPhotoUrl,
    this.birthDate,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    final profileData = json[ApiKey.profile] as Map<String, dynamic>;

    final avatarPath = profileData[ApiKey.avatar] as String?;
    final idPhotoPath = profileData[ApiKey.idPhoto] as String?;

    String? getFullImageUrl(String? path) {
      if (path == null || path.isEmpty) return null;
      return '${ApiConstants.StorageBaseUrl}$path';
    }

    return ProfileModel(
      firstName: profileData[ApiKey.firstName] as String,
      lastName: profileData[ApiKey.lastName] as String,
      avatarUrl: getFullImageUrl(avatarPath),
      idPhotoUrl: getFullImageUrl(idPhotoPath),
      birthDate: profileData[ApiKey.birthDate] as String?,
    );
  }
}