import 'package:get_it/get_it.dart';
import 'package:tawjihi_quiz/core/utils/validation.dart';

import 'data/api/my_api.dart';
import 'data/local/local_hive.dart';

final locator = GetIt.instance;

class ServicesLocator {
  static void init() {
    locator.registerLazySingleton(() => DioHelper());
    locator.registerLazySingleton(() => DataManager());
    locator.registerLazySingleton(() => Validation());
  }
}
