part of 'chat_cubit.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class LoadingChatState extends ChatState {}

class LoadingButton extends ChatState {}

class SuccessChatState extends ChatState {}

class ErrorChatState extends ChatState {
  final String? error;
  ErrorChatState({this.error});
}
