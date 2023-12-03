import 'package:get/get.dart';

import 'repositories/auth_repository.dart';
import 'repositories/sample_object_repository.dart';

class DomainConfig {
  static Future<void> init() async {
    Get.lazyPut(() => AuthRepository(authApiClient: Get.find()));
    Get.lazyPut(() => SampleObjectRepository(sampleObjectApiClient: Get.find()));
  }
}
