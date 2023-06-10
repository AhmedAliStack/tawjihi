import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawjihi_quiz/core/utils/utils.dart';
import 'package:tawjihi_quiz/data/api/my_api.dart';
import 'package:tawjihi_quiz/services_locator.dart';

part 'support_state.dart';

class SupportCubit extends Cubit<SupportState> {
  SupportCubit() : super(SupportInitial());
  static SupportCubit get(context) => BlocProvider.of(context);
  final titleControler = TextEditingController(),
      megControler = TextEditingController();

  sendSupportMsg() async {
    Map<String, String> requestBody = {
      "from": Utils.userModel.user!.name!.toString(),
      "user_id": Utils.userModel.user!.id!.toString(),
      "title": titleControler.text.trim(),
      "message": megControler.text.trim(),
    };
    final respose = await locator<DioHelper>().postData(
        url: "contact", loading: true, token: Utils.token, body: requestBody);
    if (respose?.statusCode == 200) {
      emit(SuccessSupportState());
    } else {
      emit(ErrorSupportState(error: respose?.statusMessage));
    }
  }
}
