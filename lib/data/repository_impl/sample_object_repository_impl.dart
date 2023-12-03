import '../../domain/entities/models/sample_object_model.dart';
import '../../domain/repositories/sample_object_repository.dart';
import '../source/api/sample_object/sample_object_api_client.dart';

class SampleObjectRepositoryImpl implements SampleObjectRepository {
  SampleObjectRepositoryImpl({required this.sampleObjectApiClient});

  final SampleObjectApiClient sampleObjectApiClient;

  @override
  Future<SampleObject> get({required int id}) async {
    var response = await sampleObjectApiClient.api.get(id);
    return SampleObject.fromJson(response.data);
  }

  @override
  Future<List<SampleObject>> getAll() async {
    var response = await sampleObjectApiClient.api.getAll();
    return response.parseList(
      (json) => SampleObject.fromJson(json),
    );
  }
}
