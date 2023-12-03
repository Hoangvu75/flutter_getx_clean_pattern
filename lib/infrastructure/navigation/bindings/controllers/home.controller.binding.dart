import 'package:get/get.dart';

import '../../../../presentation/home/controllers/dialog_controller.dart';
import '../../../../presentation/home/controllers/home.controller.dart';
import '../domains/auth_repository_binding.dart';
import '../domains/sample_object_repository_binding.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    final authRepositoryBinding = AuthRepositoryBinding();
    final sampleObjectRepositoryBinding = SampleObjectRepositoryBinding();

    Get.lazyPut<DialogController>(
      () => DialogController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(
        authRepository: authRepositoryBinding.authRepository,
        sampleObjectRepository:
            sampleObjectRepositoryBinding.sampleObjectRepository,
      ),
    );
  }
}
