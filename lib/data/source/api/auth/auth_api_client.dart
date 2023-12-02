import 'package:example_get_clean/data/source/api/auth/auth_api.dart';
import 'package:example_get_clean/data/source/api/base_api_client_interface.dart';

class AuthApiClient extends BaseApiClientInterface {
  late final AuthApi api;
  @override
  void onInit() {
    super.onInit();
    api = AuthApi(dio, baseUrl: baseURL);
  }
}