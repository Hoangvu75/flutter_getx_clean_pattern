import 'package:get/get.dart';

import '../domain/repository_export.dart';

class InfrastructureConfig {
  static void init() {
    serviceConfig();
  }

  static void serviceConfig() {
    Get.lazyPut(() => AuthRepository(authApiClient: Get.find()));
    Get.lazyPut(() => SampleObjectRepository(sampleObjectApiClient: Get.find()));
  }
}