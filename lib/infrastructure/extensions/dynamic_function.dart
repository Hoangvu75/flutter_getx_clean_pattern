extension DynamicFunctionExtension on dynamic Function(Map<String, dynamic>) {
  dynamic Function(dynamic) convertParamToDynamic() {
    return (dynamic dynamic) {
      return this(dynamic);
    };
  }
}
