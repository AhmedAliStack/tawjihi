import '../../core/utils/statics.dart';
import '../../core/utils/utils.dart';
import '../../data/api/my_api.dart';
import '../../data/local/local_hive.dart';
import '../../services_locator.dart';

class SettingsRepo {
  static logout() async {
    final respose = await locator<DioHelper>().postData(
      url: "user/logout",
      loading: true,
      token: Utils.token,
    );
    if (respose != null) {
      await locator<DataManager>().deleteData(Statics.user);
      await locator<DataManager>().deleteData(Statics.token);
      Utils.token = "";
      return respose.data;
    } else {
      return null;
    }
  }
}
