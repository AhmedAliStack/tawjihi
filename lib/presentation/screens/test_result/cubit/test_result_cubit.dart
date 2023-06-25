import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawjihi_quiz/core/utils/utils.dart';
import 'package:tawjihi_quiz/data/api/my_api.dart';
import 'package:tawjihi_quiz/domain/models/result_model.dart';
import 'package:tawjihi_quiz/services_locator.dart';

part 'test_result_state.dart';

class TestResultCubit extends Cubit<TestResultState> {
  TestResultCubit() : super(TestResultInitial());
  static TestResultCubit get(context) => BlocProvider.of(context);
  ResultModel? resultModel;
  getResult(int resultID) async {
    emit(LoadingTestResultState());
    final respose = await locator<DioHelper>()
        .getData(url: "answers/$resultID", loading: false, token: Utils.token);
    if (respose?.statusCode == 200) {
      resultModel = ResultModel.fromJson(respose?.data);
      emit(SuccessTestResultState());
    } else {
      emit(ErrorTestResultState(error: respose?.statusMessage));
    }
  }
}
