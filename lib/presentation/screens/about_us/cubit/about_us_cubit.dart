import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawjihi_quiz/core/utils/utils.dart';
import 'package:tawjihi_quiz/data/api/my_api.dart';
import 'package:tawjihi_quiz/services_locator.dart';

part 'about_us_state.dart';

class AboutUsCubit extends Cubit<AboutUsState> {
  AboutUsCubit() : super(AboutUsInitial());
  static AboutUsCubit get(context) => BlocProvider.of(context);
  String? aboutUs;
  getAboutUs() async {
    emit(LoadingAboutUsState());
    final respose = await locator<DioHelper>()
        .getData(url: "about", loading: false, token: Utils.token);
    if (respose?.statusCode == 200) {
      aboutUs = respose?.data["data"];
      emit(SuccessAboutUsState());
    } else {
      emit(ErrorAboutUsState(error: respose?.statusMessage));
    }
  }
}
