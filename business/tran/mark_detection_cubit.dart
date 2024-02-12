import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled1/model/tran/tran.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/model/user/userweb.dart';
part 'mark_detection_state.dart';

class MarkDetectionCubit extends Cubit<MarkDetectionState> {
  MarkDetectionCubit() : super(MarkDetectionInitial());
  TransictionModel2 ? tranModel;
  static MarkDetectionCubit get (context)=>BlocProvider.of(context);

  void makeTran ({
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
    required String price,


  }){
    emit(MarkDetectionLoading());
    UserWeb.postData(url: "transaction",
        data: {
          "tran_name":tran_name,
          "father":father,
          "mother":mother,
          "section":section,
          "reg_uni":reg_uni,
          "year":year,
          "chapter":chapter,
          "course_name":course_name,
          "course_year":course_year,
          "teach":teach,
          "price":price,

        }).then((value) {
      print("sucesssssssss");
      tranModel=TransictionModel2.formjson(value.data);
      emit(MarkDetectionSuccess(tranModel!));
    }).catchError((error){
      print(error.toString());
      emit(MarkDetectionError(error.toString()));
    });
  }
}
