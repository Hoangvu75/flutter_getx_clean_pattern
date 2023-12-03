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
    required this.userStorage,
    required this.sampleObjectStorage,
  });

  final AuthRepository authRepository;
  final SampleObjectRepository sampleObjectRepository;
  final UserStorage userStorage;
  final SampleObjectStorage sampleObjectStorage;

  @override
  Future<void> onInit() async {
    super.onInit();
    sampleObjectStorage.clearSampleObject();
    saveSampleObjectToLocal();
    getSampleObjectFromLocal();

    await userStorage.cacheToken("token");
    print(userStorage.accessToken);

    authRepository.login(username: "username", password: "password");
  }

  void saveSampleObjectToLocal() {
    SampleObject sampleObject = SampleObject(
      id: 1,
      name: "sample",
    );
    sampleObjectStorage.cacheSampleObject(sampleObject);
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
    print(sampleObjects);
  }

  void showSnackBar() {
    SnackBarUtil.showErrorMessage("message");
  }
}
