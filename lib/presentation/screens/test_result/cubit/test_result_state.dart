part of 'test_result_cubit.dart';

abstract class TestResultState {}

class TestResultInitial extends TestResultState {}

class LoadingTestResultState extends TestResultState {}

class SuccessTestResultState extends TestResultState {}

class ErrorTestResultState extends TestResultState {
  final String? error;
  ErrorTestResultState({this.error});
}
