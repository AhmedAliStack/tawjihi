import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawjihi_quiz/core/utils/utils.dart';
import 'package:tawjihi_quiz/data/api/my_api.dart';
import 'package:tawjihi_quiz/domain/models/achievements_model.dart';
import 'package:tawjihi_quiz/services_locator.dart';

part 'achievements_state.dart';

class AchievementsCubit extends Cubit<AchievementsState> {
  AchievementsCubit() : super(AchievementsInitial());
  static AchievementsCubit get(context) => BlocProvider.of(context);
  AchievementsModel? achievementsModel;
  getAchievements() async {
    emit(LoadingAchievementsState());
    final respose = await locator<DioHelper>()
        .getData(url: "user/exams", loading: false, token: Utils.token);
    if (respose?.statusCode == 200) {
      achievementsModel = AchievementsModel.fromJson(respose?.data);
      emit(SuccessAchievementsState());
    } else {
      emit(ErrorAchievementsState(error: respose?.statusMessage));
    }
  }
}
