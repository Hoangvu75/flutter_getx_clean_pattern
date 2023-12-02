import '../../data/repository_impl/auth_repository_impl.dart';
import '../../data/source/api/auth/auth_api_client.dart';
import '../entities/responses/login_response.dart';

abstract class AuthRepository {
  factory AuthRepository({required AuthApiClient authApiClient}) = AuthRepositoryImpl;
  Future<LoginResponse> login({
    required String username,
    required String password,
  });
}
