part of 'subject_details_cubit.dart';

abstract class SubjectDetailsState {}

class SubjectDetailsInitial extends SubjectDetailsState {}

class LoadingSubjectDetailsState extends SubjectDetailsState {}

class SuccessSubjectDetailsState extends SubjectDetailsState {}

class ErrorSubjectDetailsState extends SubjectDetailsState {
  final String? error;
  ErrorSubjectDetailsState({this.error});
}
