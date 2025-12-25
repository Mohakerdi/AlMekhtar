class UserModel {
  final String name;
  final String email;
  final String phone;
  final String? avatarUrl;
  final String? idPhotoUrl;
  final String? firstName;
  final String? lastName;
  final String? birthDate;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    this.avatarUrl,
    this.idPhotoUrl,
    this.firstName,
    this.lastName,
    this.birthDate,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      avatarUrl: json['avatar_url'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      birthDate: json['birth_date'],
    );
  }
}