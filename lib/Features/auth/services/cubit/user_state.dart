import 'package:mabeet/data/models/profile_model.dart';
import 'package:mabeet/data/models/user_model.dart';

class UserState {}

final class UserInitial extends UserState {}

final class SignUpSuccess extends UserState {}

final class SignUpLoading extends UserState {}

final class UploadAvatarPic extends UserState {}

final class UploadIdPhoto extends UserState {}

final class SignUpFailure extends UserState {
  final String errorMessage;

  SignUpFailure({required this.errorMessage});
}

final class LogInSuccess extends UserState {}

final class LogInLoading extends UserState {}

final class LogInFailure extends UserState {
  final String errorMessage;

  LogInFailure({required this.errorMessage});
}

final class CreateProfileSuccess extends UserState {}

final class CreateProfileLoading extends UserState {}

final class CreateProfileFailure extends UserState {
  final String errorMessage;

  CreateProfileFailure({required this.errorMessage});
}

final class GetUserLoading extends UserState {}

final class GetUserSuccess extends UserState {
  final ProfileModel user;
  GetUserSuccess(this.user);
}

final class GetUserFailure extends UserState {
  final String errorMessage;
  GetUserFailure({required this.errorMessage});
}

final class ProfileCreationRequired extends UserState {}

final class UpdateProfileSuccess extends UserState {}

final class UpdateProfileLoading extends UserState {}

final class UpdateProfileFailure extends UserState {
  final String errorMessage;
  UpdateProfileFailure({required this.errorMessage});
}