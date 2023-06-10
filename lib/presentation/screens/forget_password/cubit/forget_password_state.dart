part of 'forget_password_cubit.dart';

abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class LoadingForgetPasswordOtpState extends ForgetPasswordState {}

class SuccessForgetPasswordState extends ForgetPasswordState {
  final String msg;
  SuccessForgetPasswordState(this.msg);
}

class ErrorForgetPasswordState extends ForgetPasswordState {}

class SuccessForgetPasswordOtpState extends ForgetPasswordState {
  final String msg;
  SuccessForgetPasswordOtpState(this.msg);
}

class SuccessSendpasswordState extends ForgetPasswordState {
  final String msg;
  SuccessSendpasswordState(this.msg);
}

class ErrorForgetPasswordOtpState extends ForgetPasswordState {}
