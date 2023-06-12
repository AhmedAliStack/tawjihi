import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawjihi_quiz/core/utils/statics.dart';
import 'package:tawjihi_quiz/core/utils/utils.dart';
import 'package:tawjihi_quiz/data/api/my_api.dart';
import 'package:tawjihi_quiz/data/local/local_hive.dart';
import 'package:tawjihi_quiz/domain/models/user_model.dart';
import 'package:tawjihi_quiz/domain/repositry/auth_repo/auth_repo.dart';
import 'package:tawjihi_quiz/services_locator.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);
  String? country;
  String? manhag;
  String? term;
  String? subjectType;

  getAll() async {
    emit(LoadingProfileState());
    final respose = await AuthRepo.getAllLists();
    if (respose != null) {
      await Utils.getAllListModel();
      country = Utils
          .countries[Utils.countries.indexWhere((element) =>
              element.id.toString() ==
              Utils.userModel.user?.countryId.toString())]
          .name
          .toString();
      manhag = Utils
          .manhags[Utils.manhags.indexWhere((element) =>
              element.id.toString() ==
              Utils.userModel.user?.manhagId.toString())]
          .title
          .toString();
      term = Utils
          .terms[Utils.terms.indexWhere((element) =>
              element.id.toString() == Utils.userModel.user?.termId.toString())]
          .title
          .toString();
      subjectType = Utils
          .subjectType[Utils.subjectType.indexWhere((element) =>
              element.id.toString() ==
              Utils.userModel.user?.subjectTypeId.toString())]
          .title
          .toString();
      emit(SuccessGetAllLists());
    } else {
      emit(ErrorProfileState(error: respose.data['message']));
    }
  }

  final firstNameControler =
          TextEditingController(text: Utils.userModel.user?.firstName),
      lastNameControler =
          TextEditingController(text: Utils.userModel.user?.lastName),
      emailControler = TextEditingController(text: Utils.userModel.user?.email),
      phoneControler = TextEditingController(text: Utils.userModel.user?.phone),
      nationalityControler =
          TextEditingController(text: Utils.userModel.user?.nationality),
      passwordController = TextEditingController();

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

  updateProfile() async {
    Map<String, String> requestBody = {
      "first_name": firstNameControler.text.trim(),
      "last_name": lastNameControler.text.trim(),
      "name":
          "${firstNameControler.text.trim()} ${lastNameControler.text.trim()}",
      "email": emailControler.text.trim(),
      "phone": phoneControler.text.trim(),
      "nationality": nationalityControler.text.trim(),
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
    };
    passwordController.text.isNotEmpty
        ? requestBody.addAll({"password": passwordController.text})
        : null;
    passwordController.text.isNotEmpty
        ? requestBody.addAll({"password_confirmation": passwordController.text})
        : null;
    emit(LoadingProfileState());
    final respose = await locator<DioHelper>().postData(
        url: "user/profile/update",
        loading: false,
        token: Utils.token,
        body: requestBody);
    if (respose?.statusCode == 200) {
      Map<String, dynamic> user = {
        "token": Utils.token,
        "data": respose?.data["data"],
      };
      await locator<DataManager>().saveData(Statics.user, user.toString());
      Utils.userModel = UserModel.fromJson(user);
      print("tessssss${Utils.userModel.token}");
      emit(SuccessProfileState());
    } else {
      emit(ErrorProfileState(error: respose?.statusMessage));
    }
  }
}
