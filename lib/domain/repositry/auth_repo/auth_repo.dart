import 'package:tawjihi_quiz/core/utils/statics.dart';
import 'package:tawjihi_quiz/data/api/my_api.dart';
import 'package:tawjihi_quiz/data/local/local_hive.dart';
import 'package:tawjihi_quiz/domain/models/all_lists_model.dart';
import 'package:tawjihi_quiz/services_locator.dart';

import '../../../core/utils/utils.dart';

class AuthRepo {
  static getAllLists() async {
    final respose = await locator<DioHelper>().getData(
      url: "getters/all",
      loading: false,
    );
    if (respose != null) {
      await locator<DataManager>().saveData(Statics.allLists, respose.data);
      await Utils.getAllListModel();
      return respose.data['data'];
    } else {
      return null;
    }
  }

  static loginRequest({required String phone, required String password}) async {
    final respose = await locator<DioHelper>().postData(
      url: "user/login",
      body: {'phone': phone, 'password': password},
      loading: true,
    );
    if (respose != null) {
      await locator<DataManager>().saveData(Statics.user, respose.data['data']);
      Utils.token = respose.data['data']['token'];
      return respose.data['data'];
    } else {
      return null;
    }
  }

  static signUpRequest({
    required Map<String, String> requestBody,
  }) async {
    final respose = await locator<DioHelper>().postData(
      url: "user/register",
      body: requestBody,
      loading: true,
    );
    if (respose != null) {
      await locator<DataManager>().saveData(Statics.user, respose.data['data']);
      Utils.token = respose.data['data']['token'];
      return respose.data['data'];
    } else {
      return null;
    }
  }

  // static sendOtpRequest({required String otp, required String userId}) async {
  //   final respose = await Utils.dio.postData(
  //       url: EndPoints.SEND_CODE,
  //       body: {
  //         "code": otp,
  //         "user_id": userId,
  //       },
  //       loading: true,
  //       isForm: true);
  //   if (respose != null) {
  //     Utils.token = respose.data['data']['token'];
  //     return respose.data['data']['user'];
  //   } else {
  //     return null;
  //   }
  // }

  // static forgetPassRequest({required String phone}) async {
  //   final respose = await Utils.dio.postData(
  //     url: EndPoints.FORGET_PASS,
  //     body: {'phone': phone},
  //     loading: true,
  //   );
  //   if (respose != null) {
  //     Utils.userModel = User.fromJson(respose.data['data']['user']);
  //     OverLays.toast(
  //       text: respose.data['message'],
  //     );

  //     return respose.data['data']['user'];
  //   }
  // }

  // static sendCodeRequest({
  //   required String code,
  //   // required String pass,
  //   // required String confirmPass
  // }) async {
  //   final respose = await Utils.dio.postData(
  //       url: EndPoints.SEND_CODE_RESET_PASS,
  //       body: {
  //         "user_id": Utils.userModel.id,
  //         "code": code,
  //         // "password": pass,
  //         // "password_confirmation": confirmPass,
  //       },
  //       loading: true,
  //       isForm: false);
  //   if (respose != null) {
  //     // OverLays.toast(
  //     //   text: respose.data['message'],
  //     // );
  //     Utils.userModel = User.fromJson(respose.data['data']['user']);

  //     return respose.data['data']['user'];
  //   }
  // }

  // static resetPassRequest(
  //     {required String pass, required String confirmPass}) async {
  //   final respose = await Utils.dio.postData(
  //       url: EndPoints.RESET_PASS,
  //       body: {
  //         "user_id": Utils.userModel.id,
  //         "password": pass,
  //         "password_confirmation": confirmPass,
  //       },
  //       loading: true,
  //       isForm: false);
  //   if (respose != null) {
  //     OverLays.toast(
  //       text: respose.data['message'],
  //     );

  //     return respose.data['message'];
  //   }
  // }

  // static resendCodeRequest() async {
  //   final respose = await Utils.dio.postData(
  //       url: EndPoints.RSEND_CODE,
  //       body: {
  //         "user_id": Utils.userModel.id,
  //       },
  //       loading: true,
  //       isForm: false);
  //   if (respose != null) {
  //     OverLays.toast(
  //       text: respose.data['message'],
  //     );

  //     return respose.data['message'];
  //   }
  // }
}
