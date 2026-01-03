import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mabeet/Features/auth/services/cubit/user_state.dart';
import 'package:mabeet/data/models/profile_model.dart';
import 'package:mabeet/data/models/user_model.dart';
import 'package:mabeet/data/repos/user_repo.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userRepository) : super(UserInitial());

  final UserRepository userRepository;
  UserModel? currentUser;
  ProfileModel? currentProfile;
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPhone = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();
  TextEditingController signUpPasswordConfirmation = TextEditingController();
  TextEditingController signUpName = TextEditingController();

  TextEditingController logInPhone = TextEditingController();
  TextEditingController logInPassword = TextEditingController();

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController birthDate = TextEditingController();

  XFile? avatarPic;
  XFile? idPhoto;

  void selectImage({required XFile image, required bool isAvatar}) {
    if (isAvatar) {
      avatarPic = image;
      emit(UploadAvatarPic());
    } else {
      idPhoto = image;
      emit(UploadIdPhoto());
    }
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
      (model) {
        _resetAuthFields();
        emit(SignUpSuccess());
      }
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
        currentUser = UserModel(name: model.name, email: model.email, phone: model.phone);
        currentProfile = null;
        _resetAuthFields();
        emit(LogInSuccess());
      },
    );
  }

  logOut() async {
    _resetAuthFields();
    currentUser = null;
    currentProfile = null;
    emit(UserInitial());
    await userRepository.logout();
  }

  Future<void> saveProfile({required bool isCreation}) async {

    if (firstName.text.isEmpty || lastName.text.isEmpty || birthDate.text.isEmpty) {
      emit(CreateProfileFailure(errorMessage: 'Please fill all required fields.'));
      return;
    }

    if (isCreation && (avatarPic == null || idPhoto == null)) {
      emit(CreateProfileFailure(errorMessage: 'Please upload both photos for creation.'));
      return;
    }

    emit(isCreation ? CreateProfileLoading() : UpdateProfileLoading());

    final response = isCreation
        ? await userRepository.createProfile(
      firstName: firstName.text,
      lastName: lastName.text,
      birthDate: birthDate.text,
      avatarPic: avatarPic!,
      idPhoto: idPhoto!,
    )
        : await userRepository.updateProfile(
      firstName: firstName.text,
      lastName: lastName.text,
      birthDate: currentProfile!.birthDate,
      avatarPic: avatarPic,
    );

    response.fold(
          (errorMessage) => emit(isCreation
          ? CreateProfileFailure(errorMessage: errorMessage)
          : UpdateProfileFailure(errorMessage: errorMessage)),
          (_) async {
            getUserProfile();
        emit(isCreation ? CreateProfileSuccess() : UpdateProfileSuccess());
      },
    );
  }

  Future<void> getUserProfile() async {
    emit(GetUserLoading());
    final response = await userRepository.getUserProfile();

    response.fold(
          (errorMessage) {
        if (errorMessage == 'PROFILE_MISSING_ERROR') {
          emit(ProfileCreationRequired());
        } else {
          emit(GetUserFailure(errorMessage: errorMessage));
        }
      },
          (profileModel) {
            currentProfile = profileModel;
        emit(GetUserSuccess(profileModel));
      },
    );
  }

  void _resetAuthFields() {
    signUpEmail.clear();
    signUpPhone.clear();
    signUpPassword.clear();
    signUpPasswordConfirmation.clear();
    signUpName.clear();
    logInPhone.clear();
    logInPassword.clear();
    avatarPic = null;
    idPhoto = null;
    firstName.clear();
    lastName.clear();
    birthDate.clear();
  }
}
