import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawjihi_quiz/core/utils/utils.dart';
import 'package:tawjihi_quiz/data/api/my_api.dart';
import 'package:tawjihi_quiz/domain/models/achievements_details_model.dart';
import 'package:tawjihi_quiz/services_locator.dart';

part 'achievements_details_state.dart';

class AchievementsDetailsCubit extends Cubit<AchievementsDetailsState> {
  AchievementsDetailsCubit() : super(AchievementsDetailsInitial());
  static AchievementsDetailsCubit get(context) => BlocProvider.of(context);
  AchievementsDetailsModel? achievementsDetailsModel;
  getAchievementsDetails(int id) async {
    emit(LoadingAchievementsDetailsState());
    final respose = await locator<DioHelper>().getData(
        url: "exams/studentBySubject/$id", loading: false, token: Utils.token);
    if (respose?.statusCode == 200) {
      achievementsDetailsModel =
          AchievementsDetailsModel.fromJson(respose?.data);
      emit(SuccessAchievementsDetailsState());
    } else {
      emit(ErrorAchievementsDetailsState(error: respose?.statusMessage));
    }
  }
}
