import '../../../domain/entities/models/sample_object_model.dart';
import '../../../infrastructure/extensions/dynamic_function.dart';
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

  Future<void> clearSampleObject() async {
    return _sampleHiveObjectBox.clear();
  }
}
