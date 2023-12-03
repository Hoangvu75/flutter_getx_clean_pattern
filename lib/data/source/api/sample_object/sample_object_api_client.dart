import '../base_api_client_interface.dart';
import 'sample_object_api.dart';

class SampleObjectApiClient extends BaseApiClientInterface {
  late final SampleObjectApi api;

  @override
  void onInit() {
    super.onInit();
    api = SampleObjectApi(dio);
  }
}
