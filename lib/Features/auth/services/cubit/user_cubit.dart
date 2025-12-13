import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/auth/services/cubit/user_state.dart';
import 'package:mabeet/core/api/api_consumer.dart';
import 'package:mabeet/core/api/api_constants.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api) : super(UserInitial());

  final ApiConsumer api;

  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPhone = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();
  TextEditingController signUpName = TextEditingController();

  TextEditingController logInPhone = TextEditingController();
  TextEditingController logInPassword = TextEditingController();

  signUp() async {
    try {
      emit(SignUpLoading());
      final response = await Dio().post(
        '${ApiConstants.BaseUrl}/signin',
        data: {
          'email': signUpEmail.text,
          'name': signUpName.text,
          'phone': signUpPhone.text,
          'password': signUpPassword.text,
        },
      );
      emit(SignUpSuccess());
      print(response);
    } on Exception catch (e) {
      emit(SignUpFailure(errorMessage: e.toString()));
      print(e.toString());
    }
  }

  LogIn() async {
    try {
      emit(LogInLoading());
      final response = await api.post(
        '${ApiConstants.BaseUrl}/signin',
        data: {'phone': logInPhone.text, 'password': logInPassword.text},
      );
      emit(LogInSuccess());
      print(response);
    } on Exception catch (e) {
      emit(LogInFailure(errorMessage: e.toString()));
      print(e.toString());
    }
  }
}
