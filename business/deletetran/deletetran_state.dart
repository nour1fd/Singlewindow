part of 'deletetran_cubit.dart';

@immutable
abstract class DeletetranState {}

class DeletetranInitial extends DeletetranState {}
class DeletetranLoading extends DeletetranInitial {}
class   DeletetranSuccess extends DeletetranInitial {

}
class  DeletetranError extends DeletetranInitial {
  final String error;

  DeletetranError(this.error);
}