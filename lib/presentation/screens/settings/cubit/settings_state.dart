part of 'settings_cubit.dart';

abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class SuccessLogoutState extends SettingsState {}

class ErrorLogoutState extends SettingsState {
  final String error;
  ErrorLogoutState(this.error);
}
