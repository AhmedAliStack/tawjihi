part of 'subject_cubit.dart';

abstract class SubjectState {}

class SubjectInitial extends SubjectState {}

class LoadingSubjectState extends SubjectState {}

class SuccessSubjectState extends SubjectState {}

class ErrorSubjectState extends SubjectState {
  final String? error;
  ErrorSubjectState({this.error});
}
