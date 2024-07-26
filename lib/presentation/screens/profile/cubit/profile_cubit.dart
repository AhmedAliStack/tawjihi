import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tawjihi_quiz/core/utils/statics.dart';
import 'package:tawjihi_quiz/core/utils/utils.dart';
import 'package:tawjihi_quiz/data/api/my_api.dart';
import 'package:tawjihi_quiz/data/local/local_hive.dart';
import 'package:tawjihi_quiz/domain/models/all_lists_model.dart';
import 'package:tawjihi_quiz/domain/models/user_model.dart';
import 'package:tawjihi_quiz/domain/repositry/auth_repo/auth_repo.dart';
import 'package:tawjihi_quiz/presentation/components/alerts.dart';
import 'package:tawjihi_quiz/services_locator.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);
  Countries? country;
  Manhags? manhag;
  Terms? term;
  Types? subjectType;
  Years? years;
  TermsById? termsById;
  getTermsIdLists({required int id, required bool changeState}) async {
    final respose = await AuthRepo.getTermsIdLists(id: id);
    if (respose != null) {
      respose.forEach((v) {
        Utils.termsByYearId.add(TermsById.fromJson(v));
      });
      if (changeState) {
        emit(GetTermsByYearIdSuccess());
      }
    } else {
      return null;
    }
  }

  getAll() async {
    emit(LoadingProfileState());
    await getTermsIdLists(id: Utils.userModel.user!.yearId, changeState: false);

    await Utils.getAllListModel();
    country = Utils.countries[Utils.countries.indexWhere((element) =>
        element.id.toString() == Utils.userModel.user?.countryId.toString())];

    manhag = Utils.manhags[Utils.manhags.indexWhere((element) =>
        element.id.toString() == Utils.userModel.user?.manhagId.toString())];

    term = Utils.terms[Utils.terms.indexWhere((element) =>
        element.id.toString() == Utils.userModel.user?.termId.toString())];

    subjectType = Utils.subjectType[Utils.subjectType.indexWhere((element) =>
        element.id.toString() ==
        Utils.userModel.user?.subjectTypeId.toString())];
    years = Utils.years[Utils.years.indexWhere((element) =>
        element.id.toString() == Utils.userModel.user?.yearId.toString())];

    termsById = Utils.termsByYearId[Utils.termsByYearId.indexWhere((element) =>
        element.id.toString() == Utils.userModel.user?.termId.toString())];
    emit(SuccessGetAllLists());
    // } else {
    //   emit(ErrorProfileState(error: "A"
    //respose.data['message']
    //   ));
    // }
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
      case 5:
        years = value;
         getTermsIdLists(id: value.id, changeState: true);

        break;
      case 6:
        termsById = value;
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
      "country_id": country?.id.toString() ?? "",
      "manhag_id": manhag?.id.toString() ?? "",
      "term_id": termsById?.id.toString() ?? "",
      "subject_type_id": subjectType?.id.toString() ?? "",
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
        "user": respose?.data["data"],
      };
      await locator<DataManager>().saveData(Statics.user, user);
      Utils.userModel = UserModel.fromJson(user);
      emit(SuccessProfileState());
    } else {
      emit(ErrorProfileState(error: respose?.data.toString()));
    }
  }

  File? profileImage;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      profileImage = imageTemporary;
      updateImage();
    } catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }

  updateImage() async {
    emit(LoadingImageState());
    final respose = await locator<DioHelper>().postData(
        url: "user/photo-update",
        loading: false,
        token: Utils.token,
        isFile: true,
        isForm: true,
        body: {
          'image': await MultipartFile.fromFile(profileImage!.path,
              filename: profileImage?.path.split(Platform.pathSeparator).last),
        });
    if (respose?.statusCode == 200) {
      await getProfile();
      OverLays.toast(text: respose?.data['data']) ?? "تم تعديل الصورة بنجاح";
    } else {
      emit(ErrorProfileState(error: respose?.data.toString()));
    }
  }

  getProfile() async {
    final respose = await locator<DioHelper>().getData(
      url: "user/profile",
      loading: false,
      token: Utils.token,
    );
    if (respose?.statusCode == 200) {
      Map<String, dynamic> user = {
        "token": Utils.token,
        "user": respose?.data["data"],
      };
      await locator<DataManager>().saveData(Statics.user, user);
      Utils.userModel = UserModel.fromJson(user);
      emit(SuccessUpdateImage());
    } else {
      emit(ErrorProfileState(error: respose?.data.toString()));
    }
  }
}
