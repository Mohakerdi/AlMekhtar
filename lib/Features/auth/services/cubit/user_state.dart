class UserState {}

final class UserInitial extends UserState {}

final class SignUpSuccess extends UserState {}

final class SignUpLoading extends UserState {}

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
