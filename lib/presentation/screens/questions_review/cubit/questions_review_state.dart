part of 'questions_review_cubit.dart';

abstract class QuestionsReviewState {}

class QuestionsReviewInitial extends QuestionsReviewState {}

class LoadingQuestionsReviewState extends QuestionsReviewState {}

class SuccessQuestionsReviewState extends QuestionsReviewState {}

class ErrorQuestionsReviewState extends QuestionsReviewState {
  final String? error;
  ErrorQuestionsReviewState({this.error});
}

class ChangeQuestionNumber extends QuestionsReviewState {}

class FinishExamReview extends QuestionsReviewState {}
