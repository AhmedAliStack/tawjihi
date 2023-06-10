import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawjihi_quiz/core/utils/utils.dart';
import 'package:tawjihi_quiz/data/api/my_api.dart';
import 'package:tawjihi_quiz/domain/models/subject_model.dart';
import 'package:tawjihi_quiz/services_locator.dart';

part 'subject_state.dart';

class SubjectCubit extends Cubit<SubjectState> {
  SubjectCubit() : super(SubjectInitial());
  static SubjectCubit get(context) => BlocProvider.of(context);
  SubjectModel? subjectModel;
  getSubject() async {
    emit(LoadingSubjectState());
    final respose = await locator<DioHelper>()
        .getData(url: "subjects", loading: false, token: Utils.token);
    if (respose?.statusCode == 200) {
      subjectModel = SubjectModel.fromJson(respose?.data);
      emit(SuccessSubjectState());
    } else {
      emit(ErrorSubjectState(error: respose?.statusMessage));
    }
  }
}
