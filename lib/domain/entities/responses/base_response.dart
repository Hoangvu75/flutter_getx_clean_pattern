class BaseResponse<T> {
  BaseResponse({
    this.code,
    this.message,
    this.data,
  });

  final int? code;
  final String? message;
  final dynamic data;

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'code': code,
      'message': message,
      'data': data,
    };
  }

  List<T> parseList<T>(T Function(Map<String, dynamic>) parser) {
    if (data is List) {
      return (data as List<dynamic>).map((e) => parser(e as Map<String, dynamic>)).toList();
    } else {
      throw FormatException("Error: ", data);
    }
  }
}