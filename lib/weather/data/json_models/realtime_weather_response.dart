import 'package:portfoliome/core/api/api_response.dart';

class RealtimeWeatherResponse extends ApiResponse {
  final Map<String, dynamic>? parsedJson;

  const RealtimeWeatherResponse({
    int? statusCode,
    bool isSuccess = false,
    this.parsedJson,
    String? error,
  }) : super(statusCode: statusCode, isSuccess: isSuccess, error: error);
}
