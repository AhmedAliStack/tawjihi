part of 'forget_password_cubit.dart';

abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class SuccessForgetPasswordState extends ForgetPasswordState {
  final String msg;
  SuccessForgetPasswordState(this.msg);
}

class ErrorForgetPasswordState extends ForgetPasswordState {}
