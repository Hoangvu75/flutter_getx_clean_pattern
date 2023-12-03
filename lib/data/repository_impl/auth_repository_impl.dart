import '../source/api/auth/auth_api_client.dart';
import '../../domain/entities/api_responses/login_response.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this.authApiClient});

  final AuthApiClient authApiClient;

  @override
  Future<LoginResponse> login({
    required String username,
    required String password,
  }) async {
    var response = await authApiClient.api.login({
      "username": username,
      "password": password,
    });
    return LoginResponse.fromJson(response.data);
  }
}
