part of 'mark_detection_cubit.dart';

@immutable
abstract class MarkDetectionState {}

class MarkDetectionInitial extends MarkDetectionState {}
class MarkDetectionLoading extends MarkDetectionState {}
class MarkDetectionSuccess extends MarkDetectionState {
  final TransictionModel2 tranModel;

  MarkDetectionSuccess(this.tranModel);
}
class MarkDetectionError extends MarkDetectionState {
  final String error;
  MarkDetectionError(this.error);}
