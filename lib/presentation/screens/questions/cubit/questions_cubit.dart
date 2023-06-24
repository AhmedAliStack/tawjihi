import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawjihi_quiz/core/utils/utils.dart';
import 'package:tawjihi_quiz/data/api/my_api.dart';
import 'package:tawjihi_quiz/domain/models/questions_model.dart';
import 'package:tawjihi_quiz/services_locator.dart';

part 'questions_state.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  QuestionsCubit() : super(QuestionsInitial());
  static QuestionsCubit get(context) => BlocProvider.of(context);
  QuestionsModel? questionsModel;
  int questionNumber = 0;

  getQuestions(int examId) async {
    emit(LoadingQuestionsState());
    final respose = await locator<DioHelper>()
        .getData(url: "questions/exam/1", loading: false, token: Utils.token);
    if (respose?.statusCode == 200) {
      questionsModel = QuestionsModel.fromJson(respose?.data);
      emit(SuccessQuestionsState());
    } else {
      emit(ErrorQuestionsState(error: respose?.statusMessage));
    }
  }

  int? trueOrFalse;
  bool trueOrFalseClick = false;
  trueOrFalseChange({String? field1, String? field2}) async {
    if (field1 != null) {
      if (questionsModel!.questions![questionNumber].answer == field1) {
        trueOrFalse = 1;
        trueOrFalseClick = true;
        emit(TrueOrFalse());
        return;
      }
    } else {
      if (questionsModel!.questions![questionNumber].answer == field2) {
        trueOrFalse = 2;
        trueOrFalseClick = true;
        emit(TrueOrFalse());
        return;
      }
    }
  }

  sendAnswer({required int questionId}) async {
    emit(LoadingSendAnswer());
    final respose = await locator<DioHelper>().postData(
        url: "answers/store/$questionId",
        body: {
          "user_id": Utils.userModel.user?.id,
          "question_id": questionId,
          "exam_id": questionsModel?.questions?[0].examId,
          "answer": trueOrFalse == 1 ? "1" : "0",
          "result_id": questionsModel?.resultId,
        },
        token: Utils.token);
    if (respose?.statusCode == 200) {
      print("send answer response : ${respose?.data}");
      if (questionsModel!.questions!.length - 1 == questionNumber) {
        emit(FinishExam());
        return;
      }
      questionNumber++;
      trueOrFalse = null;
      trueOrFalseClick = false;
      emit(SuccessSendAnswer());
    } else {
      emit(ErrorSendAnswerState(error: respose?.statusMessage));
    }
  }
}
