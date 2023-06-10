import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawjihi_quiz/core/utils/utils.dart';
import 'package:tawjihi_quiz/data/api/my_api.dart';
import 'package:tawjihi_quiz/domain/models/my_teachers_model.dart';
import 'package:tawjihi_quiz/services_locator.dart';

part 'my_teacher_state.dart';

class MyTeacherCubit extends Cubit<MyTeacherState> {
  MyTeacherCubit() : super(MyTeacherInitial());
  static MyTeacherCubit get(context) => BlocProvider.of(context);
  MyTeachersModel? myTeachersModel;
  getMyTeachers() async {
    emit(LoadingMyTeacherState());
    final respose = await locator<DioHelper>()
        .getData(url: "teachers", loading: false, token: Utils.token);
    if (respose?.statusCode == 200) {
      myTeachersModel = MyTeachersModel.fromJson(respose?.data);
      emit(SuccessMyTeacherState());
    } else {
      emit(ErrorMyTeacherState(error: respose?.statusMessage));
    }
  }
}
