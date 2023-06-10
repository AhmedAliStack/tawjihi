import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawjihi_quiz/core/utils/utils.dart';
import 'package:tawjihi_quiz/data/api/my_api.dart';
import 'package:tawjihi_quiz/domain/models/my_teachers_model.dart';
import 'package:tawjihi_quiz/services_locator.dart';

part 'subject_details_state.dart';

class SubjectDetailsCubit extends Cubit<SubjectDetailsState> {
  SubjectDetailsCubit() : super(SubjectDetailsInitial());
  static SubjectDetailsCubit get(context) => BlocProvider.of(context);
  List<Data>? subjectDetails = [];
  getDetailsSubject(int id) async {
    emit(LoadingSubjectDetailsState());
    final respose = await locator<DioHelper>().getData(
        url: "teachers/subject/$id", loading: false, token: Utils.token);
    if (respose?.statusCode == 200) {
      subjectDetails = [];
      respose?.data['data'].forEach((element) {
        subjectDetails?.add(Data.fromJson(element));
      });
      emit(SuccessSubjectDetailsState());
    } else {
      emit(ErrorSubjectDetailsState(error: respose?.statusMessage));
    }
  }
}
