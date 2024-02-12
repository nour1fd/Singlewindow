import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled1/model/tran/transication.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/model/user/userweb.dart';
part 'editingtran_state.dart';

class EditingtranCubit extends Cubit<EditingtranState> {
  EditingtranCubit() : super(EditingtranInitial());
  TransictionModel? deletemodel;
  TransictionModel? updatmodel;
  static EditingtranCubit get(context) => BlocProvider.of(context);
  void updatingtran({
    required String tran_name,
    required String father,
    required String mother,
    required String section,
    required String reg_uni,
    required String year,
    required String chapter,
    required String course_name,
    required String course_year,
    required String teach,
  }) {
    emit(UpdateTranLoading());
    UserWeb.PutData(url: '', data: {
      "tran_name": tran_name,
      "father": father,
      "mother": mother,
      "section": section,
      "reg_uni": reg_uni,
      "year": year,
      "chapter": chapter,
      "course_name": course_name,
      "course_year": course_year,
      "teach": teach,
    }).then((value) {
      print("updation done");
      updatmodel = TransictionModel.fromJson(value.data);
      print(value.data);
      emit(UpdateTranSuccess(updatmodel!));
    }).catchError((error) {
      print(error.toString() + "mmmmmmmmmmmmmmmmmmmmm");
      emit(UpdateTranError(error.toString()));
    });
  }

  void deletetran() {
    emit(deleteTranLoading());
    UserWeb.deleteData(
      url: '',
    ).then((value) {
      deletemodel = TransictionModel.fromJson(value.data);
      emit(deleteTranSuccess());
    }).catchError((error) {
      emit(deleteTranError(error.toString()));
      print(error.toString());
    });
  }
}
