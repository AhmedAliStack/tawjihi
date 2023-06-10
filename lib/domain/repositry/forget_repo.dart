import 'package:tawjihi_quiz/data/api/my_api.dart';
import 'package:tawjihi_quiz/services_locator.dart';

class ForgetRepo {
  static requiredMsgForgetpassword({required String email}) async {
    final respose = await locator<DioHelper>().postData(
      url: "send-reset-password-otp",
      body: {"email": email},
      loading: true,
    );
    if (respose != null) {
      return respose.data['message'];
    } else {
      return null;
    }
  }

  static sendOtp({required String otp, required String email}) async {
    final respose = await locator<DioHelper>().postData(
      url: "validate-reset-password",
      body: {"email": email, "otp": otp},
      loading: false,
    );
    if (respose != null) {
      return respose.data['message'];
    } else {
      return null;
    }
  }

  static resetPassword({
    required String otp,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    final respose = await locator<DioHelper>().postData(
      url: "validate-reset-password",
      body: {
        "email": email,
        "otp": otp,
        "password": password,
        "password_confirmation": confirmPassword
      },
      loading: true,
    );
    if (respose != null) {
      return respose.data['message'];
    } else {
      return null;
    }
  }
}
