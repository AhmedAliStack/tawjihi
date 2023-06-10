part of 'notifications_cubit.dart';

abstract class NotificationsState {}

class NotificationsInitial extends NotificationsState {}

class LoadingNotificationsState extends NotificationsState {}

class SuccessNotificationsState extends NotificationsState {}

class ErrorNotificationsState extends NotificationsState {
  final String? error;
  ErrorNotificationsState({this.error});
}
