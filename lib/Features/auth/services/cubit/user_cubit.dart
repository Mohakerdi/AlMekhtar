import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/auth/services/cubit/user_state.dart';
import 'package:mabeet/data/api_service/api_constants.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(super.initialState);

  signIn() async{
    try {
      final response = await Dio().post(
        '${ApiConstants.BaseUrl}/signin',
        data: {
          'email': 'email',
          // name password phone
        },
      );
    } on Exception catch (e) {print(e.toString());}
  }
}
