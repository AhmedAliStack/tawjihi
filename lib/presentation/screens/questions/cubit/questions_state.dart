part of 'questions_cubit.dart';

abstract class QuestionsState {}

class QuestionsInitial extends QuestionsState {}

class LoadingQuestionsState extends QuestionsState {}

class SuccessQuestionsState extends QuestionsState {}

class ErrorQuestionsState extends QuestionsState {
  final String? error;
  ErrorQuestionsState({this.error});
}

class LoadingSendAnswer extends QuestionsState {}

class SuccessSendAnswer extends QuestionsState {}

class ErrorSendAnswerState extends QuestionsState {
  final String? error;
  ErrorSendAnswerState({this.error});
}

class TrueOrFalse extends QuestionsState {}

class FinishExam extends QuestionsState {}
