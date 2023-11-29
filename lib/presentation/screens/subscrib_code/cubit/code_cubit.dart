import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawjihi_quiz/core/utils/utils.dart';
import 'package:tawjihi_quiz/data/api/my_api.dart';
import 'package:tawjihi_quiz/services_locator.dart';

part 'code_state.dart';

class CodeCubit extends Cubit<CodeState> {
  CodeCubit() : super(CodeInitial());
  static CodeCubit get(context) => BlocProvider.of(context);

  sendCode(String code) async {
    emit(LoadingCodeState());
    final respose = await locator<DioHelper>()
        .postData(url: "user/code", loading: false, token: Utils.token, body: {
      "code": code,
    });
    if (respose?.statusCode == 200) {
      emit(SuccessCodeState());
    } else {
      emit(ErrorCodeState(error: respose?.statusMessage));
    }
  }

  requestCode({bool firstRequest = true}) async {
    firstRequest
        ? emit(LoadingRequestCode())
        : emit(LoadingRequestCodeButton());
    final respose = await locator<DioHelper>()
        .postData(url: "user/request-code", loading: false, token: Utils.token);
    if (respose?.statusCode == 200) {
      emit(SuccessRequestCode());
    } else {
      emit(ErrorCodeState(error: respose?.statusMessage));
    }
  }
}
