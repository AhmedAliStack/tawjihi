part of 'my_teacher_cubit.dart';

abstract class MyTeacherState {}

class MyTeacherInitial extends MyTeacherState {}

class LoadingMyTeacherState extends MyTeacherState {}

class SuccessMyTeacherState extends MyTeacherState {}

class ErrorMyTeacherState extends MyTeacherState {
  final String? error;
  ErrorMyTeacherState({this.error});
}
