part of 'editingtran_cubit.dart';

@immutable
abstract class EditingtranState {}

class EditingtranInitial extends EditingtranState {}
class   UpdateTranLoading extends EditingtranInitial {}
class UpdateTranSuccess extends EditingtranInitial {
  final TransictionModel updateediting;
  UpdateTranSuccess(this.updateediting);
}
class  UpdateTranError extends EditingtranInitial {
  final String error;
  UpdateTranError(this.error);
}
class  deleteTranLoading extends EditingtranInitial {}
class deleteTranSuccess extends EditingtranInitial {
 }
class  deleteTranError extends EditingtranInitial {
  final String error;
  deleteTranError(this.error);
}