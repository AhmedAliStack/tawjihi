import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawjihi_quiz/core/utils/utils.dart';
import 'package:tawjihi_quiz/data/api/my_api.dart';
import 'package:tawjihi_quiz/domain/models/best_model.dart';
import 'package:tawjihi_quiz/domain/models/best_teachers_model.dart';
import 'package:tawjihi_quiz/services_locator.dart';

part 'the_best_state.dart';

class TheBestCubit extends Cubit<TheBestState> {
  TheBestCubit() : super(TheBestInitial());
  static TheBestCubit get(context) => BlocProvider.of(context);
  int type = 0;
  BestModel? bestModel;
  BestTeachersModel? bestTeachersModel;
  changeButton(int typeButton) {
    type = typeButton;
    type == 0 ? getBestStudents(listonly: true) : getBestTeachers();
  }

  getBestStudents({bool listonly = false}) async {
    listonly
        ? emit(LoadingTheBestStudentsState())
        : emit(LoadingTheBestState());
    final respose = await locator<DioHelper>()
        .getData(url: "user/best", loading: false, token: Utils.token);
    if (respose?.statusCode == 200) {
      bestModel = BestModel.fromJson(respose?.data);
      emit(SuccessTheBestState());
    } else {
      emit(ErrorTheBestState(error: respose?.statusMessage));
    }
  }

  getBestTeachers() async {
    emit(LoadingTheBestTeachersState());
    final respose = await locator<DioHelper>()
        .getData(url: "teachers/best", loading: false, token: Utils.token);
    if (respose?.statusCode == 200) {
      bestTeachersModel = BestTeachersModel.fromJson(respose?.data);
      emit(SuccessTheBestState());
    } else {
      emit(ErrorTheBestState(error: respose?.statusMessage));
    }
  }
}
