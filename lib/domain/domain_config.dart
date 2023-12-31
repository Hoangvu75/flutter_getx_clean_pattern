import 'package:get/get.dart';

import 'repository_export.dart';

class DomainConfig {
  static void init() {
    repositoryConfig();
  }

  static void repositoryConfig() {
    Get.lazyPut(() => AuthRepository(authApiClient: Get.find()));
    Get.lazyPut(() => SampleObjectRepository(sampleObjectApiClient: Get.find()));
  }
}
