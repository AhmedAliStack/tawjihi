import 'package:tawjihi_quiz/data/api/my_api.dart';
import 'package:tawjihi_quiz/services_locator.dart';

class ForgetRepo {
  static forgetPassword({required String email}) async {
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
}
