import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawjihi_quiz/core/utils/utils.dart';
import 'package:tawjihi_quiz/data/api/my_api.dart';
import 'package:tawjihi_quiz/domain/models/best_model.dart';
import 'package:tawjihi_quiz/services_locator.dart';

part 'the_best_state.dart';

class TheBestCubit extends Cubit<TheBestState> {
  TheBestCubit() : super(TheBestInitial());
  static TheBestCubit get(context) => BlocProvider.of(context);
  int type = 0;
  BestModel? bestModel;
  changeButton(int typeButton) {
    type = typeButton;
    getBest();
  }

  getBest() async {
    emit(LoadingTheBestState());
    final respose = await locator<DioHelper>().getData(
        url: type == 0 ? "user/best" : "teachers/best",
        loading: false,
        token: Utils.token);
    if (respose?.statusCode == 200) {
      bestModel = BestModel.fromJson(respose?.data);
      emit(SuccessTheBestState());
    } else {
      emit(ErrorTheBestState(error: respose?.statusMessage));
    }
  }
}
