import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawjihi_quiz/domain/repositry/auth_repo/auth_repo.dart';

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
    final respose = await AuthRepo.loginRequest(
        phone: phoneControler.text.trim(), password: passwordController.text);
    if (respose != null) {
      AuthRepo.getAllLists();
      emit(SuccessLoginState());
    } else {
      emit(ErrorLoginState(respose.data['message']));
    }
  }
}
