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

  bool? correctOrWrong;
  String? postAnswer;
  bool click = false;
  trueOrFalseChange({required String value}) async {
    postAnswer = value;
    if (questionsModel!.questions![questionNumber].answer == value) {
      correctOrWrong = true;
      click = true;
    } else {
      correctOrWrong = false;
      click = true;
    }
    emit(AnswerDone());
  }

  oneChoose({required String value, required dynamic key}) async {
    postAnswer = value;
    if (key == null) {
      correctOrWrong = false;
      click = true;
    } else {
      correctOrWrong = true;
      click = true;
    }
    emit(AnswerDone());
  }

  List<int> more = [];
  List<String> mainValue = [];
  List<dynamic> mainKey = [];
  morechooseTrue(
      {required String value1,
      required dynamic key1,
      required int field}) async {
    more.add(field);
    mainValue.add(value1);
    mainKey.add(key1);
    if (more.length == 2) {
      moreChoose(
          value: "${mainValue[0]},${mainValue[1]}",
          key1: mainKey[0],
          key2: mainKey[1]);
    } else {
      emit(AnswerDone());
    }
  }

  moreChoose(
      {required String value,
      required dynamic key1,
      required dynamic key2}) async {
    postAnswer = value;
    if (key1 == null || key2 == null) {
      correctOrWrong = false;
      click = true;
    } else {
      correctOrWrong = true;
      click = true;
    }
    emit(AnswerDone());
  }

  sendAnswer({required int questionId, bool back = false}) async {
    if (back) {
      questionNumber--;
      correctOrWrong = null;
      click = false;
      more = [];
      mainValue = [];
      mainKey = [];
      emit(SuccessSendAnswer());
      return;
    }
    emit(LoadingSendAnswer());
    final respose = await locator<DioHelper>().postData(
        url: "answers/store/$questionId",
        body: {
          "user_id": Utils.userModel.user?.id,
          "question_id": questionId,
          "exam_id": questionsModel?.questions?[0].examId,
          "answer": postAnswer,
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
      correctOrWrong = null;
      click = false;
      more = [];
      mainValue = [];
      mainKey = [];
      emit(SuccessSendAnswer());
    } else {
      emit(ErrorSendAnswerState(error: respose?.statusMessage));
    }
  }
}
