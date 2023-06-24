part of 'converstions_cubit.dart';

abstract class ConverstionsState {}

class ConverstionsInitial extends ConverstionsState {}

class LoadingConverstionsState extends ConverstionsState {}

class SuccessConverstionsState extends ConverstionsState {}

class ErrorConverstionsState extends ConverstionsState {
  final String? error;
  ErrorConverstionsState({this.error});
}
