import 'package:http/http.dart';

class ApiResponse {
  final int? statusCode;
  final bool isSuccess;
  final String? error;
  final Response? response;

  const ApiResponse({
    this.statusCode,
    this.isSuccess = false,
    this.error,
    this.response,
  });
}
