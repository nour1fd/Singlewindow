import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled1/const.dart';
import 'package:untitled1/model/user/user.dart';
import 'package:untitled1/model/user/userweb.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  UserModel ? loginmodel;

  static LoginCubit get(context) => BlocProvider.of(context);
  void userlogin({
    required String password,
    required String email,
  }) {
    emit(LoginLoading());
    UserWeb.postData(url: "login", data: {
      "email": email,
      "password": password,
    }).then((value) {
      print("sucesssssssss");
      print('$token');

      loginmodel = UserModel.formjson(value.data);
      print(value.data);
      emit(LoginSuccess(loginmodel!));
    }).catchError((error) {
      print(error.toString());
      emit(LoginError(error.toString()));
    });
  }}