part of 'approveaccount_cubit.dart';

@immutable
abstract class ApproveaccountState {}

class ApproveaccountInitial extends ApproveaccountState {}
class ApproveaccountLoading extends ApproveaccountState {}
class ApproveaccountSuccess extends ApproveaccountState {
  final UserModel approveModel;

  ApproveaccountSuccess(this.approveModel);
}
class LoginError extends ApproveaccountState {
  final String error;
  LoginError(this.error);
}