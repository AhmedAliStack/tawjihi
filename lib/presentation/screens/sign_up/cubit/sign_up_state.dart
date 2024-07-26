part of 'sign_up_cubit.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class LoadingSignUpState extends SignUpState {}

class SuccessGetAllLists extends SignUpState {}

class SuccessSignUpState extends SignUpState {}

class ErrorSignUpState extends SignUpState {
  final String error;
  ErrorSignUpState(this.error);
}

class ChangeSelectedItemDropDown extends SignUpState {}

class ChangeCheckBox extends SignUpState {}

class GetTermsByYearIdSuccess extends SignUpState {}
