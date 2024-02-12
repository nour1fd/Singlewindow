import 'package:meta/meta.dart';
import 'package:untitled1/const.dart';
import 'package:untitled1/model/tran/transication.dart';
import 'package:untitled1/model/user/userweb.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'deletetran_state.dart';

class DeletetranCubit extends Cubit<DeletetranState> {
  DeletetranCubit() : super(DeletetranInitial());

  TransictionModel? delettran;

  static DeletetranCubit get(context) => BlocProvider.of(context);


  void deleteAddress(int tranid) {
    emit(DeletetranLoading());
    UserWeb.deleteData(
      url: 'transaction/$tranid',
    ).then((value) {
      delettran = TransictionModel.fromJson(value.data[0]);
      print('delete Address ' + delettran!.toString());
      emit(DeletetranSuccess());
    }).catchError((error) {
      emit(DeletetranError(error.toString()));
      print(error.toString());
    });
  }

  }

