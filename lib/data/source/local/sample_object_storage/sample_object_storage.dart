import 'package:example_get_clean/domain/entities/models/sample_object_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class SampleObjectStorage extends GetxService {
  late final Box<SampleObject> _sampleHiveObjectBox;

  @override
  Future<void> onInit() async {
    super.onInit();
    Hive.registerAdapter("SampleObject", SampleObject.fromJson);
    _sampleHiveObjectBox = Hive.box<SampleObject>();
  }

  @override
  void onReady() async {
    super.onReady();
    await cacheSampleObject(
      SampleObject(
        id: DateTime.now().microsecondsSinceEpoch,
        name: "Sample Object",
        description: "This is a sample object",
      ),
    );
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
