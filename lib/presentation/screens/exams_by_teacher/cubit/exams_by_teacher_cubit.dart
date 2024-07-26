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
  int activeExam = 0;
  PagingController<int, exams.Data> pagingController =
      PagingController(firstPageKey: 1);

  getExams({required int id, required int page}) async {
    final response = await locator<DioHelper>()
        .getData(url: "exams/teacher/$id?page=$page", loading: false, token: Utils.token);
    if (response?.statusCode == 200) {
      exams.ExamsByTeacherModel examsByTeacher =
          exams.ExamsByTeacherModel.fromJson(response?.data);
      activeExam = examsByTeacher.activeExam ?? 0;
      final isLastPage = examsByTeacher.meta?.total == page;
      List<exams.Data>? examsData = examsByTeacher.data!.isEmpty ? [] : examsByTeacher.data;
      if (isLastPage) {
        pagingController.appendLastPage(examsData ?? []);
      } else {
        final nextPageKey = page + 1;
        pagingController.appendPage(examsData ?? [], nextPageKey);
      }
      emit(SuccessExamsByTeacherState());
    } else {
      emit(ErrorExamsByTeacherState(error: response?.statusMessage));
    }
  }
}
