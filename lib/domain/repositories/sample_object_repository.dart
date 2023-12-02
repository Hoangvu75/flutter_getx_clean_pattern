import 'package:example_get_clean/domain/entities/models/sample_object_model.dart';

import '../../data/repository_impl/sample_object_repository_impl.dart';
import '../../data/source/api/sample_object/sample_object_api_client.dart';

abstract class SampleObjectRepository {
  factory SampleObjectRepository({
    required SampleObjectApiClient sampleObjectApiClient,
  }) = SampleObjectRepositoryImpl;
  Future<SampleObject> get({required int id});
  Future<List<SampleObject>> getAll();
}
