import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawjihi_quiz/domain/repositry/forget_repo.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());
  static ForgetPasswordCubit get(context) => BlocProvider.of(context);
  TextEditingController emailControler = TextEditingController();
  forgetPassword() async {
    final respose =
        await ForgetRepo.forgetPassword(email: emailControler.text.trim());
    if (respose != null) {
      emit(SuccessForgetPasswordState(respose));
    } else {
      emit(ErrorForgetPasswordState());
    }
  }
}
