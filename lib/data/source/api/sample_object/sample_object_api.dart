import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../domain/entities/api_responses/base_response.dart';

part 'sample_object_api.g.dart';

@RestApi()
abstract class SampleObjectApi {
  factory SampleObjectApi(Dio dio, {String baseUrl}) = _SampleObjectApi;

  @GET("/sample-object/get/{id}")
  Future<BaseResponse> get(@Path() int id);

  @GET("/sample-object/get-all")
  Future<BaseResponse> getAll();
}
