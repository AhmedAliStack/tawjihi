import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawjihi_quiz/domain/models/all_lists_model.dart';

import '../../../../core/utils/utils.dart';
import '../../../../domain/repositry/auth_repo/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  static SignUpCubit get(context) => BlocProvider.of(context);

  final firstNameControler = TextEditingController(),
      lastNameControler = TextEditingController(),
      emailControler = TextEditingController(),
      phoneControler = TextEditingController(),
      nationalityControler = TextEditingController(),
      passwordConfirmation = TextEditingController(),
      passwordController = TextEditingController();

  String? country;
  String? manhag;
  String? term;
  changeSelectedItemDropDown({required value, required int numer}) {
    switch (numer) {
      case 1:
        country = value;
        break;
      case 2:
        manhag = value;
        break;
      case 3:
        term = value;
        break;
    }
    emit(ChangeSelectedItemDropDown());
  }

  bool checkBox = false;
  changeCheckBox(bool value) {
    checkBox = value;
    emit(ChangeCheckBox());
  }

  signUp() async {
    emit(LoadingSignUpState());
    final respose = await AuthRepo.signUpRequest(
      firstName: firstNameControler.text.trim(),
      lastName: lastNameControler.text.trim(),
      email: emailControler.text.trim(),
      phone: phoneControler.text.trim(),
      nationality: nationalityControler.text.trim(),
      password: passwordController.text,
      passwordConfirmation: passwordConfirmation.text,
      countryId: Utils
          .countries[
              Utils.countries.indexWhere((element) => element.name == country)]
          .id
          .toString(),
      manhagId: Utils
          .manhags[
              Utils.manhags.indexWhere((element) => element.title == manhag)]
          .id
          .toString(),
      termId: Utils
          .terms[Utils.terms.indexWhere((element) => element.title == term)].id
          .toString(),
    );
    if (respose != null) {
      emit(SuccessSignUpState());
    } else {
      emit(ErrorSignUpState());
    }
  }
}
