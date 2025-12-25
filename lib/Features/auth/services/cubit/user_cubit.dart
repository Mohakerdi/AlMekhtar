import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mabeet/Features/auth/services/cubit/user_state.dart';
import 'package:mabeet/core/api/api_constants.dart';
import 'package:mabeet/core/cache/cache_helper.dart';
import 'package:mabeet/data/models/sign_up_model.dart';
import 'package:mabeet/data/repos/user_repo.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userRepository) : super(UserInitial());

  final UserRepository userRepository;

  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPhone = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();
  TextEditingController signUpPasswordConfirmation = TextEditingController();
  TextEditingController signUpName = TextEditingController();

  TextEditingController logInPhone = TextEditingController();
  TextEditingController logInPassword = TextEditingController();

  XFile? profilePic;

  uploadProfilePic(XFile image) {
    profilePic = image;
    emit(UploadProfilePic());
  }

  signUp() async {
    emit(SignUpLoading());
    final response = await userRepository.signUp(
      email: signUpEmail.text,
      password: signUpPassword.text,
      name: signUpName.text,
      phone: signUpPhone.text,
      passwordConfirmation: signUpPasswordConfirmation.text,
    );
    response.fold(
      (errorMessage) => emit(SignUpFailure(errorMessage: errorMessage)),
      (model) => emit(SignUpSuccess()),
    );
  }

  logIn() async {
    emit(LogInLoading());
    final response = await userRepository.logIn(
      credential: logInPhone.text,
      password: logInPassword.text,
    );
    response.fold(
      (errorMessage) => emit(LogInFailure(errorMessage: errorMessage)),
      (model) {
        CacheHelper.saveData(
          key: ApiKey.token,
          value: model.token,
        ); // new adding by steve to save
        emit(LogInSuccess());
      },
    );
  }
}
