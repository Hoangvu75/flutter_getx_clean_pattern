import 'package:example_get_clean/domain/entities/models/sample_object_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class SampleObjectStorage extends GetxService {
  late final Box<_SampleHiveObject> _sampleHiveObjectBox;
  @override
  void onInit() {
    super.onInit();
    _sampleHiveObjectBox = Hive.box<_SampleHiveObject>('HIVE_SAMPLE_OBJECT_BOX');
  }
  Future<void> cacheSampleObject(SampleObject sampleObject) async {
    return _sampleHiveObjectBox.put(
      sampleObject.id,
      _SampleHiveObject(sampleObject: sampleObject),
    );
  }
  SampleObject? getSampleObject(int id) {
    return _sampleHiveObjectBox.get(id)?.toSampleObject();
  }
  SampleObject? getSampleObjectAt(int position) {
    return _sampleHiveObjectBox.getAt(position)?.toSampleObject();
  }
  List<SampleObject> getSampleObjectList() {
    List<SampleObject> sampleObjects = [];
    for (var element in _sampleHiveObjectBox.values) {
      final sampleObject = element.toSampleObject();
      sampleObjects.add(sampleObject);
    }
    return sampleObjects;
  }
}

class _SampleHiveObject extends HiveObject {
  _SampleHiveObject({required SampleObject sampleObject}) {
    id = sampleObject.id;
    name = sampleObject.name;
    description = sampleObject.description;
  }

  @HiveField(0)
  int? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? description;

  SampleObject toSampleObject() {
    return SampleObject(
      id: id,
      name: name,
      description: description,
    );
  }
}