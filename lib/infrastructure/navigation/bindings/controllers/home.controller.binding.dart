import 'package:get/get.dart';

import '../../../../presentation/home/controllers/dialog_controller.dart';
import '../../../../presentation/home/controllers/home.controller.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DialogController>(
      () => DialogController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(
        authRepository: Get.find(),
        sampleObjectRepository: Get.find(),
        userStorage: Get.find(),
        sampleObjectStorage: Get.find(),
      ),
    );
  }
}
