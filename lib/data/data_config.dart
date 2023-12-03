import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'source_export.dart';

class DataConfig {
  static Future<void> init() async {
    apiDataSourceConfig();
    await localDataSourceConfig();
    socketDataSourceConfig();
  }

  static void apiDataSourceConfig() {
    Get.lazyPut(() => AuthApiClient());
    Get.lazyPut(() => SampleObjectApiClient());
  }

  static void socketDataSourceConfig() {
    Get.put(() => MessageSocket(), permanent: true);
  }

  static Future<void> localDataSourceConfig() async {
    Hive.defaultDirectory = (await getApplicationDocumentsDirectory()).path;
    Get.lazyPut(() => UserStorage());
    Get.lazyPut(() => SampleObjectStorage());
  }
}