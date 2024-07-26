import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawjihi_quiz/core/utils/statics.dart';
import 'package:tawjihi_quiz/core/utils/utils.dart';
import 'package:tawjihi_quiz/data/local/local_hive.dart';
import 'package:tawjihi_quiz/domain/models/user_model.dart';
import 'package:tawjihi_quiz/domain/repositry/auth_repo/auth_repo.dart';
import 'package:tawjihi_quiz/services_locator.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  final phoneControler = TextEditingController(),
      passwordController = TextEditingController();

  bool checkBox = false;
  changeCheckBox(bool value) {
    checkBox = value;
    emit(ChangeCheckBox());
  }

  login() async {
    Response? respose = await AuthRepo.loginRequest(
        phone: phoneControler.text.trim(), password: passwordController.text);
    print("Status ${respose?.statusCode}");
    if (respose != null && respose?.statusCode == 200) {
      await locator<DataManager>().saveData(Statics.user, respose.data['data']);
      await locator<DataManager>()
          .saveData(Statics.token, respose.data['data']['token']);
      Utils.token = respose.data['data']['token'];
      Utils.userModel = UserModel.fromJson(respose.data['data']);
      respose.data['data'];
      AuthRepo.getAllLists();
      emit(SuccessLoginState());
    } else {
      emit(ErrorLoginState(respose?.data['message']));
    }
  }
}
