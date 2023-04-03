import '../../core/utils/statics.dart';
import '../../core/utils/utils.dart';
import '../../data/api/my_api.dart';
import '../../data/local/local_hive.dart';
import '../../services_locator.dart';
import '../models/all_lists_model.dart';

class SplashRepo {
  static getAllLists() async {
    final respose = await locator<DioHelper>().getData(
        url: "getters/all",
        loading: false,
        token: "3|P5FAYz1CDhFssivMIUSDAU2xOeMpV3I2k5dz6TWV");
    if (respose != null) {
      await locator<DataManager>().saveData(Statics.allLists, respose.data);
      AllListsModel? lists = await Utils.getAllListModel();
      if (lists != null) {
        Utils.countries = lists.data?.countries ?? [];
        Utils.manhags = lists.data?.manhags ?? [];
        Utils.terms = lists.data?.terms ?? [];
        Utils.types = lists.data?.types ?? [];
      }
      return respose.data['data'];
    } else {
      return null;
    }
  }
}
