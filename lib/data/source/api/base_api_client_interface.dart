import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../local/user_storage.dart';

abstract class BaseApiClientInterface extends GetxService {
  late final Dio dio;
  late final String baseURL;

  @override
  void onInit() {
    super.onInit();
    baseURL = "https://restful-booker.herokuapp.com";
    dio = Dio();
    dio.options = BaseOptions(
      baseUrl: baseURL,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      validateStatus: (status) {
        return status! < 500;
      },
      contentType: Headers.jsonContentType,
    );
    dio.interceptors
      ..add(
        PrettyDioLogger(
          request: true,
          requestBody: true,
          responseBody: true,
          error: true,
        ),
      )
      ..add(
        InterceptorsWrapper(
          onRequest: (
            RequestOptions options,
            RequestInterceptorHandler handler,
          ) {
            UserStorage localService = Get.find();
            final token = localService.accessToken;
            if (token != null) {
              options.headers['Authorization'] = "Bearer $token";
            }
            handler.next(options);
          },
          onError: (
            DioException exception,
            ErrorInterceptorHandler handler,
          ) {
            throw exception;
          },
        ),
      );
  }
}
