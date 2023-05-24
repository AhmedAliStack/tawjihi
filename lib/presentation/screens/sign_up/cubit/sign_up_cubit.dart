import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/utils.dart';
import '../../../../domain/repositry/auth_repo/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  static SignUpCubit get(context) => BlocProvider.of(context);

  getAll() async {
    emit(LoadingSignUpState());
    final respose = await AuthRepo.getAllLists();
    if (respose != null) {
      await Utils.getAllListModel();
      emit(SuccessGetAllLists());
    } else {
      emit(ErrorSignUpState(respose.data['message']));
    }
  }

  final firstNameControler = TextEditingController(),
      lastNameControler = TextEditingController(),
      emailControler = TextEditingController(),
      phoneControler = TextEditingController(),
      nationalityControler = TextEditingController(),
      passwordController = TextEditingController(),
      passwordConfirmation = TextEditingController();

  String? country;
  String? manhag;
  String? term;
  String? subjectType;
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
      case 4:
        subjectType = value;
        break;
    }
    emit(ChangeSelectedItemDropDown());
  }

  bool checkBox = false;
  changeCheckBox(bool value) {
    checkBox = value;
    emit(ChangeCheckBox());
  }

  sendData() async {
    final respose = await AuthRepo.signUpRequest(requestBody: {
      "first_name": firstNameControler.text.trim(),
      "last_name": lastNameControler.text.trim(),
      "name":
          "${firstNameControler.text.trim()} ${lastNameControler.text.trim()}",
      "email": emailControler.text.trim(),
      "phone": phoneControler.text.trim(),
      "nationality": nationalityControler.text.trim(),
      "password": passwordController.text,
      "password_confirmation": passwordConfirmation.text,
      "country_id": Utils
          .countries[
              Utils.countries.indexWhere((element) => element.name == country)]
          .id
          .toString(),
      "manhag_id": Utils
          .manhags[
              Utils.manhags.indexWhere((element) => element.title == manhag)]
          .id
          .toString(),
      "term_id": Utils
          .terms[Utils.terms.indexWhere((element) => element.title == term)].id
          .toString(),
      "subject_type_id": Utils
          .subjectType[Utils.subjectType
              .indexWhere((element) => element.title == subjectType)]
          .id
          .toString(),
    });
    if (respose != null) {
      emit(SuccessSignUpState());
    } else {
      emit(ErrorSignUpState(respose.data['message']));
    }
  }
}
