import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:tawjihi_quiz/core/utils/utils.dart';
import 'package:tawjihi_quiz/data/api/my_api.dart';
import 'package:tawjihi_quiz/domain/models/exams_by_teacher_model.dart'
    as exams;
import 'package:tawjihi_quiz/services_locator.dart';

part 'exams_by_teacher_state.dart';

class ExamsByTeacherCubit extends Cubit<ExamsByTeacherState> {
  ExamsByTeacherCubit() : super(ExamsByTeacherInitial());
  static ExamsByTeacherCubit get(context) => BlocProvider.of(context);
  PagingController<int, exams.Data> pagingController =
      PagingController(firstPageKey: 1);

  getExams({required int id, required int page}) async {
    final response = await locator<DioHelper>()
        .getData(url: "exams/teacher/$id", loading: false, token: Utils.token);
    if (response?.statusCode == 200) {
      exams.ExamsByTeacherModel examsByTeacher =
          exams.ExamsByTeacherModel.fromJson(response?.data);
      final isLastPage = examsByTeacher.meta?.total == page;
      if (isLastPage) {
        pagingController.appendLastPage(examsByTeacher.data ?? []);
      } else {
        final nextPageKey = page + 1;
        pagingController.appendPage(examsByTeacher.data ?? [], nextPageKey);
      }
      emit(SuccessExamsByTeacherState());
    } else {
      emit(ErrorExamsByTeacherState(error: response?.statusMessage));
    }
  }
}
