import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawjihi_quiz/core/utils/utils.dart';
import 'package:tawjihi_quiz/data/api/my_api.dart';
import 'package:tawjihi_quiz/domain/models/result_model.dart';
import 'package:tawjihi_quiz/services_locator.dart';

part 'questions_review_state.dart';

class QuestionsReviewCubit extends Cubit<QuestionsReviewState> {
  QuestionsReviewCubit() : super(QuestionsReviewInitial());
  static QuestionsReviewCubit get(context) => BlocProvider.of(context);
  ResultModel? resultModel;
  int questionNumber = 0;
  bool? isSameMoreChoose;
  incrementQuestionNumber() {
    if (resultModel?.data?.answers?.length == questionNumber + 1) {

      return;
    }
    questionNumber++;
    if (resultModel!.data!.answers![questionNumber].question!.questionType ==
        "2") {
      List<String> myAnswers =
          resultModel!.data!.answers![questionNumber].answer!.split(',');
      List<String> correctAnswers =
          resultModel!.data!.answers![questionNumber].correctAnswer!.split(',');
      bool isSame = listEquals(myAnswers, correctAnswers);
      isSameMoreChoose = isSame;
    } else {
      isSameMoreChoose = null;
    }
    emit(ChangeQuestionNumber());
  }

  decrementQuestionNumber() {
    questionNumber--;
    emit(ChangeQuestionNumber());
  }

  getQuestionsReview(int resultId) async {
    emit(LoadingQuestionsReviewState());
    final respose = await locator<DioHelper>()
        .getData(url: "answers/$resultId", loading: false, token: Utils.token);
    if (respose?.statusCode == 200) {
      resultModel = ResultModel.fromJson(respose?.data);
      emit(SuccessQuestionsReviewState());
    } else {
      emit(ErrorQuestionsReviewState(error: respose?.statusMessage));
    }
  }
}
