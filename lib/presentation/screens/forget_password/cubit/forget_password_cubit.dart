import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawjihi_quiz/domain/repositry/forget_repo.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());
  static ForgetPasswordCubit get(context) => BlocProvider.of(context);
  TextEditingController emailControler = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  requiredMsgForgetpassword({VoidCallback? onSuccess}) async {
    final respose = await ForgetRepo.requiredMsgForgetpassword(
        email: emailControler.text.trim());
    if (respose != null) {
      emit(SuccessForgetPasswordState(respose));
      onSuccess?.call();
    } else {
      emit(ErrorForgetPasswordState());
    }
  }

  String otp = "";
  sendOtp() async {
    emit(LoadingForgetPasswordOtpState());
    final respose =
        await ForgetRepo.sendOtp(email: emailControler.text.trim(), otp: otp);
    if (respose != null) {
      emit(SuccessForgetPasswordOtpState(respose));
    } else {
      emit(ErrorForgetPasswordOtpState());
    }
  }

  resetPassword() async {
    final respose = await ForgetRepo.resetPassword(
        email: emailControler.text.trim(),
        otp: otp,
        password: emailControler.text,
        confirmPassword: confirmPassword.text);
    if (respose != null) {
      emit(SuccessSendpasswordState(respose));
    } else {
      emit(ErrorForgetPasswordOtpState());
    }
  }
}
