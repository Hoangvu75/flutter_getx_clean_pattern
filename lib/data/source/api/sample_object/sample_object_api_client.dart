import 'package:example_get_clean/data/source/api/auth/auth_api.dart';
import 'package:example_get_clean/data/source/api/base_api_client_interface.dart';
import 'package:example_get_clean/data/source/api/sample_object/sample_object_api.dart';

class SampleObjectApiClient extends BaseApiClientInterface {
  late final SampleObjectApi api;
  @override
  void onInit() {
    super.onInit();
    api = SampleObjectApi(dio, baseUrl: baseURL);
  }
}