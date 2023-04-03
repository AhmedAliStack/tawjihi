import 'package:hive_flutter/hive_flutter.dart';

class DataManager {
  Future<void> saveData(String key, dynamic value) async {
    await Hive.initFlutter();
    final box = await Hive.openBox('data');
    await box.put(key, value);
    box.close();
  }

  getData(String key) async {
    await Hive.initFlutter();
    final box = await Hive.openBox('data');
    return await box.get(key);
  }

  deleteData() async {
    await Hive.initFlutter();
    final box = await Hive.openBox('data');
    await box.clear();
  }
}
