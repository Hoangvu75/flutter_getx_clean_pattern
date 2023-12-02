import 'package:example_get_clean/data/source/api/auth/auth_api_client.dart';
import 'package:example_get_clean/data/source/api/sample_object/sample_object_api_client.dart';
import 'package:example_get_clean/data/source/local/sample_object_storage.dart';
import 'package:example_get_clean/data/source/local/user_storage.dart';
import 'package:example_get_clean/data/source/socket/message_socket.dart';
import 'package:get/get.dart';

class DataSourceConfig {
  static void init() {
    apiDataSourceConfig();
    localDataSourceConfig();
    socketDataSourceConfig();
  }

  static void apiDataSourceConfig() {
    Get.lazyPut(() => AuthApiClient());
    Get.lazyPut(() => SampleObjectApiClient());
  }

  static void socketDataSourceConfig() {
    Get.put(MessageSocket(), permanent: true);
  }

  static void localDataSourceConfig() {
    Get.put(UserStorage(), permanent: true);
    Get.put(SampleObjectStorage(), permanent: true);
  }
}