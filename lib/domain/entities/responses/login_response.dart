class LoginResponse {
  final String? refreshToken;
  final String? accessToken;
  final String? authToken;
  LoginResponse({this.accessToken, this.authToken, this.refreshToken});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accessToken: json['accessToken'],
      authToken: json['authToken'],
      refreshToken: json['refreshToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'accessToken': accessToken,
      'authToken': authToken,
      'refreshToken': refreshToken,
    };
  }
}