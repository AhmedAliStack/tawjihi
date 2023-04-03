import 'package:tawjihi_quiz/core/utils/statics.dart';
import 'package:tawjihi_quiz/data/api/my_api.dart';
import 'package:tawjihi_quiz/data/local/local_hive.dart';
import 'package:tawjihi_quiz/services_locator.dart';

import '../../../core/utils/utils.dart';

class AuthRepo {
  // static loginRequest({required String phone, required String password}) async {
  //   final respose = await Utils.dio.postData(
  //       url: EndPoints.LOGIN,
  //       body: {'phone': phone, 'password': password, 'fcm_token': Utils.FCMToken},
  //       loading: true,
  //       );
  //   if (respose != null) {
  //     Utils.token = respose.data['data']['token'];
  //     return respose.data['data'];
  //   }
  // }

  static signUpRequest({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String nationality,
    required String password,
    required String passwordConfirmation,
    required String countryId,
    required String manhagId,
    required String termId,
  }) async {
    final respose = await locator<DioHelper>().postData(
      url: "user/register",
      body: {
        'name': firstName + lastName,
        'email': email,
        "phone": phone,
        'password': password,
        'password_confirmation': passwordConfirmation,
        'first_name': firstName,
        'last_name': lastName,
        'nationality': nationality,
        'country_id': countryId,
        'manhag_id': manhagId,
        'term_id': termId,
      },
      loading: true,
    );
    if (respose != null) {
      Utils.token = respose.data['data']['token'];
      await locator<DataManager>()
          .saveData(Statics.token, respose.data['data']['token']);
      await locator<DataManager>().saveData(Statics.user, respose.data['data']);
      return respose.data['data']['user'];
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
