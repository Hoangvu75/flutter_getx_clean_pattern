import 'package:get/get.dart';
import '../../../../domain/repositories/auth_repository.dart';

import '../../../../data/source/api/auth/auth_api_client.dart';

class AuthRepositoryBinding {
  late final AuthRepository authRepository;
  late final AuthApiClient authApiClient;

  AuthRepositoryBinding() {
    authApiClient = Get.find();
    authRepository = AuthRepository(authApiClient: authApiClient);
  }
}