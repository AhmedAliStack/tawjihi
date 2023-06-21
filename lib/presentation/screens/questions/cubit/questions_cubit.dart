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
  incrementQuestionNumber() {
    questionNumber++;
    emit(IncrementQuestionNumber());
  }

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
}
