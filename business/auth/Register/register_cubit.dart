import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled1/model/user/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/model/user/userweb.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  UserModel ? usermodel;
  static RegisterCubit get (context)=>BlocProvider.of(context);
  void userregister ({
    required String name,
    required String email,
    required String password,
    required String id_uni,
}){
  emit(RegisterLoading());
  UserWeb.postData(url: "register",
      data: {
        "name":name,
        "email":email,
        "password":password,
        "id_uni":id_uni,
      }).then((value) {
    print("sucesssssssss");
    print(value.data);
    usermodel=UserModel.formjson(value.data);
    emit(RegisterSuccess(usermodel!));
  }).catchError((error){
    print(error.toString()+"error on registering");
    emit(RegisterError(error.toString()));
  });
  }
}
