part of 'mytran_cubit.dart';

@immutable
abstract class MytranState {}

class MytranInitial extends MytranState {}
class MytranLoading extends MytranState {}
class MytranSuccess extends MytranState {
  final TransictionModel mytranModel;

  MytranSuccess(this.mytranModel);
}
class MytranError extends MytranState {
  final String error;
  MytranError(this.error);
}