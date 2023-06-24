part of 'the_best_cubit.dart';

abstract class TheBestState {}

class TheBestInitial extends TheBestState {}

class LoadingTheBestState extends TheBestState {}

class LoadingTheBestStudentsState extends TheBestState {}

class LoadingTheBestTeachersState extends TheBestState {}

class SuccessTheBestState extends TheBestState {}

class ErrorTheBestState extends TheBestState {
  final String? error;
  ErrorTheBestState({this.error});
}

class ChangeButton extends TheBestState {}
