part of 'about_us_cubit.dart';

abstract class AboutUsState {}

class AboutUsInitial extends AboutUsState {}

class LoadingAboutUsState extends AboutUsState {}

class SuccessAboutUsState extends AboutUsState {}

class ErrorAboutUsState extends AboutUsState {
  final String? error;
  ErrorAboutUsState({this.error});
}
