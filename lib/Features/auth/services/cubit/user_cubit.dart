import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mabeet/Features/auth/services/cubit/user_state.dart';
import 'package:mabeet/core/api/api_consumer.dart';
import 'package:mabeet/core/api/api_constants.dart';
import 'package:mabeet/core/errors/exceptions.dart';
import 'package:mabeet/data/models/sign_up_model.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api) : super(UserInitial());

  final ApiConsumer api;

  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPhone = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();
  TextEditingController signUpPasswordConfirmation = TextEditingController();
  TextEditingController signUpName = TextEditingController();

  TextEditingController logInPhone = TextEditingController();
  TextEditingController logInPassword = TextEditingController();

  SignUpModel? user;
  XFile? profilePic;

  uploadProfilePic(XFile image) {
    profilePic = image;
    emit(UploadProfilePic());
  }

  signUp() async {
    try {
      emit(SignUpLoading());
      final response = await api.post(
        ApiConstants.create_account,
        data: {
          ApiKey.email: signUpEmail.text,
          ApiKey.name: signUpName.text,
          ApiKey.phone: signUpPhone.text,
          ApiKey.password: signUpPassword.text,
          ApiKey.password_confirmation: signUpPasswordConfirmation.text,
        },
      );
      user = SignUpModel.fromJson(response);
      // final decodedToken = JwtDecoder.decode(user!.token);

      emit(SignUpSuccess());
    } on ServerException catch (e) {
      emit(SignUpFailure(errorMessage: e.toString()));
    }
  }

  LogIn() async {
    try {
      emit(LogInLoading());
      final response = await api.post(
        ApiConstants.login,
        data: {ApiKey.phone: logInPhone.text, ApiKey.password: logInPassword.text},
      );
      emit(LogInSuccess());
    } on ServerException catch (e) {
      emit(LogInFailure(errorMessage: e.toString()));
    }
  }
}
