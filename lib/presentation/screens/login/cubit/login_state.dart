part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class SuccessLoginState extends LoginState {}

class ErrorLoginState extends LoginState {
  final String error;
  ErrorLoginState(this.error);
}

class ChangeCheckBox extends LoginState {}
