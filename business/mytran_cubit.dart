import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled1/const.dart';
import 'package:untitled1/model/tran/transication.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/model/user/userweb.dart';
part 'mytran_state.dart';

class MytranCubit extends Cubit<MytranState> {
  MytranCubit() : super(MytranInitial());
  TransictionModel ? mytranModel;
  static MytranCubit get(context) => BlocProvider.of(context);
  void mytran() {
    emit(MytranLoading());
    UserWeb.getDtat(url: "user_tran/$userid",  Token: token).then((value) {
      mytranModel = TransictionModel.fromJson(value.data);
      emit(MytranSuccess(mytranModel!));
      print("sucesssssssss on showing your traransiction");
      print("/n");
      print('$token');
      print(value.data);
    }).catchError((error) {
      print(error.toString());
      emit(MytranError(error.toString()));
    });
  }}

// static ViewmovieCubit get(context) => BlocProvider.of(context);
//   ViewMovie ?viewmovie;
//   void viewMovie ()async
//   {
//     emit(ViewmovieLoading());
//     final results = await MovieRequest.getData();
//     emit(ViewmovieSuccess(results));
//     print(results);
//     print ("successsss");
//
//   }