import 'package:example_get_clean/data/source/local/user_storage.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class BaseApiClientInterface extends GetxService {
  late final Dio dio;
  late final String baseURL;

  @override
  void onInit() {
    super.onInit();
    dio = Dio();
    baseURL = "https://sample.api.com";
  }

  @override
  void onReady() {
    super.onReady();
    dio.interceptors.add(PrettyDioLogger(request: false, requestBody: true));
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          UserStorage localService = Get.find();
          final token = localService.accessToken;
          if (token != null) {
            options.headers['Authorization'] = "Bearer $token";
          }
          handler.next(options);
        },
        onError: (DioException exception, ErrorInterceptorHandler handler) {
          throw exception;
        },
      ),
    );
  }
}