import '../../../data/source/local/sample_object_storage.dart';
import '../../../data/source/local/user_storage.dart';
import '../../../domain/entities/models/sample_object_model.dart';
import '../../../domain/repositories/auth_repository.dart';
import '../../../domain/repositories/sample_object_repository.dart';
import '../../../infrastructure/utils/snack_bar_util.dart';
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
