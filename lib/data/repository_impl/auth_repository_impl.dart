import 'package:example_get_clean/data/source/api/auth/auth_api_client.dart';

import '../../domain/entities/responses/login_response.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this.authApiClient});
  final AuthApiClient authApiClient;
  @override
  Future<LoginResponse> login({
    required String username,
    required String password,
  }) async {
    var body = {
      "username": username,
      "password": password,
    };
    var response = await authApiClient.api.login(body);
    return LoginResponse.fromJson(response.data);
  }
}
