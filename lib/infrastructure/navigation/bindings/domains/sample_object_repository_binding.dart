import 'package:get/get.dart';
import '../../../../data/source/api/sample_object/sample_object_api_client.dart';
import '../../../../domain/repositories/sample_object_repository.dart';

class SampleObjectRepositoryBinding {
  late final SampleObjectRepository sampleObjectRepository;
  late final SampleObjectApiClient sampleObjectApiClient;

  SampleObjectRepositoryBinding() {
    sampleObjectApiClient = Get.find();
    sampleObjectRepository = SampleObjectRepository(
      sampleObjectApiClient: sampleObjectApiClient,
    );
  }
}
