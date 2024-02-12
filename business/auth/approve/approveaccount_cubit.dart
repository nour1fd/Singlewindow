import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled1/const.dart';
import 'package:untitled1/model/user/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/model/user/userweb.dart';
part 'approveaccount_state.dart';

class ApproveaccountCubit extends Cubit<ApproveaccountState> {
  ApproveaccountCubit() : super(ApproveaccountInitial());
  UserModel ? approveModel;
  static ApproveaccountCubit get(context) => BlocProvider.of(context);

  void userapprove() {
    emit(ApproveaccountLoading());
    UserWeb.getDtat(url: "register",).then((value) {
      print(" approving sucesssssssss");
      print('$token');
      approveModel = UserModel.formjson(value.data);
      print(value.data);
      emit(ApproveaccountSuccess(approveModel!));
    }).catchError((error) {
      print(error.toString());
      emit(LoginError(error.toString()));
    });
  }
}
