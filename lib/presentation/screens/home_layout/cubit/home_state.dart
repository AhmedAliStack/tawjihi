part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class ChangeScreensIndex extends HomeState {}

class HomeSuccess extends HomeState {}

class HomeError extends HomeState {
  final String error;

  HomeError(this.error);
}
