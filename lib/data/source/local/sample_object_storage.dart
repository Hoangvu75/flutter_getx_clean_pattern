import 'package:example_get_clean/domain/entities/models/sample_object_model.dart';
import 'package:example_get_clean/infrastructure/extensions/dynamic_function.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class SampleObjectStorage extends GetxService {
  late final Box<SampleObject> _sampleHiveObjectBox;

  @override
  Future<void> onInit() async {
    super.onInit();
    Hive.registerAdapter(
      (SampleObject).toString(),
      SampleObject.fromJson.convertParamToDynamic(),
    );
    _sampleHiveObjectBox = Hive.box<SampleObject>();
  }

  @override
  void onReady() async {
    super.onReady();
    _sampleHiveObjectBox.clear();
    for (int i = 0; i < 10; i++) {
      await cacheSampleObject(
        SampleObject(
          id: DateTime.now().microsecondsSinceEpoch,
          name: "Sample Object $i",
          description: "This is a sample object",
        ),
      );
    }
    print("Sample Objects Cached: ${getSampleObjectList()}");
  }

  Future<void> cacheSampleObject(SampleObject sampleObject) async {
    return _sampleHiveObjectBox.put(
      sampleObject.id.toString(),
      sampleObject,
    );
  }

  SampleObject? getSampleObject(int id) {
    return _sampleHiveObjectBox.get(id.toString());
  }

  SampleObject? getSampleObjectAt(int position) {
    return _sampleHiveObjectBox.getAt(position);
  }

  List<SampleObject> getSampleObjectList() {
    List<SampleObject> sampleObjects = [];
    for (int i = 0; i < _sampleHiveObjectBox.length; i++) {
      sampleObjects.add(_sampleHiveObjectBox.getAt(i));
    }
    return sampleObjects;
  }
}
