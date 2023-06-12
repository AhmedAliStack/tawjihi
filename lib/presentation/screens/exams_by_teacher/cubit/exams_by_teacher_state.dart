part of 'exams_by_teacher_cubit.dart';

abstract class ExamsByTeacherState {}

class ExamsByTeacherInitial extends ExamsByTeacherState {}

class LoadingExamsByTeacherState extends ExamsByTeacherState {}

class SuccessExamsByTeacherState extends ExamsByTeacherState {}

class ErrorExamsByTeacherState extends ExamsByTeacherState {
  final String? error;
  ErrorExamsByTeacherState({this.error});
}
