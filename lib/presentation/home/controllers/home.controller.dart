import 'package:example_get_clean/data/source/local/sample_object_storage/sample_object_storage.dart';
import 'package:example_get_clean/data/source/local/user_storage/user_storage.dart';
import 'package:example_get_clean/domain/entities/models/sample_object_model.dart';
import 'package:example_get_clean/domain/repositories/auth_repository.dart';
import 'package:example_get_clean/domain/repositories/sample_object_repository.dart';
import 'package:example_get_clean/infrastructure/utils/snack_bar_util.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController({
    required this.authRepository,
    required this.sampleObjectRepository,
  });

  final AuthRepository authRepository;
  final SampleObjectRepository sampleObjectRepository;
  late final UserStorage userStorage;
  late final SampleObjectStorage sampleObjectStorage;

  @override
  void onInit() {
    super.onInit();
    userStorage = Get.find();
    sampleObjectStorage = Get.find();
  }

  void getSampleObject() async {
    List<SampleObject> sampleObjects = await sampleObjectRepository.getAll();
    for (var element in sampleObjects) {
      sampleObjectStorage.cacheSampleObject(element);
    }
  }

  void getSampleObjectFromLocal() {
    List<SampleObject> sampleObjects = [];
    sampleObjectStorage.getSampleObjectList().forEach((element) {
      sampleObjects.add(element);
    });
  }

  void showSnackBar() {
    SnackBarUtil.showErrorMessage("message");
  }
}
