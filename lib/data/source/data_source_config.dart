import 'package:example_get_clean/data/source/api/auth/auth_api_client.dart';
import 'package:example_get_clean/data/source/api/sample_object/sample_object_api_client.dart';
import 'package:example_get_clean/data/source/local/sample_object_storage/sample_object_storage.dart';
import 'package:example_get_clean/data/source/local/user_storage/user_storage.dart';
import 'package:example_get_clean/data/source/socket/message_socket.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class DataSourceConfig {
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
    Get.put(MessageSocket(), permanent: true);
  }

  static Future<void> localDataSourceConfig() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive.defaultDirectory = directory.path;

    Get.put(UserStorage(), permanent: true);
    Get.put(SampleObjectStorage(), permanent: true);
  }
}