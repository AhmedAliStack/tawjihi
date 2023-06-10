part of 'support_cubit.dart';

abstract class SupportState {}

class SupportInitial extends SupportState {}

class LoadingSupportState extends SupportState {}

class SuccessSupportState extends SupportState {}

class ErrorSupportState extends SupportState {
  final String? error;
  ErrorSupportState({this.error});
}

class ChangeSelectedItemDropDown extends SupportState {}
