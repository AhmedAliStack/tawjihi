part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class LoadingProfileState extends ProfileState {}

class LoadingImageState extends ProfileState {}

class SuccessGetAllLists extends ProfileState {}

class SuccessProfileState extends ProfileState {}

class SuccessUpdateImage extends ProfileState {}

class ErrorProfileState extends ProfileState {
  final String? error;
  ErrorProfileState({this.error});
}

class ChangeSelectedItemDropDown extends ProfileState {}
class GetTermsByYearIdSuccess extends ProfileState {}
