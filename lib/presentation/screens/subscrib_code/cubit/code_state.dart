part of 'code_cubit.dart';

abstract class CodeState {}

class CodeInitial extends CodeState {}

class LoadingCodeState extends CodeState {}

class SuccessCodeState extends CodeState {}

class ErrorCodeState extends CodeState {
  final String? error;
  ErrorCodeState({this.error});
}

class LoadingRequestCode extends CodeState {}

class LoadingRequestCodeButton extends CodeState {}

class SuccessRequestCode extends CodeState {}
