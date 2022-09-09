import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:portfoliome/core/api/api.dart';
import 'package:portfoliome/weather/data/endpoints.dart';
import 'package:portfoliome/weather/data/app_provider.dart';
import 'package:portfoliome/weather/data/json_models/realtime_weather_response.dart';

class MainScreenProvider extends AppProvider {
  final _geolocator = GeolocatorPlatform.instance;
  final _geocoding = GeocodingPlatform.instance;

  Future<RealtimeWeatherResponse> getRealtimeWeather(String? query) async {
    final route = Uri.https(AppEndpoints.host, AppEndpoints.realtime, {'q': query ?? ''});
    final response = await api.request(
      route: route,
      method: Method.get,
    );

    return RealtimeWeatherResponse(
      statusCode: response.statusCode,
      isSuccess: response.isSuccess,
      error: response.isSuccess ? null : response.error,
      parsedJson: response.isSuccess ? await compute(_parseRealtimeWeather, response.response?.body) : null,
    );
  }

  Future<Placemark?> tryGetLocation() async {
    final result = await _geolocator.checkPermission();
    if (result != LocationPermission.whileInUse && result != LocationPermission.always) {
      await _geolocator.openAppSettings();
      return Future.error('Permission denied');
    }

    final locationData = await _geolocator.getCurrentPosition();
    final placemarks = await _geocoding.placemarkFromCoordinates(locationData.latitude, locationData.longitude);
    return placemarks.first;
  }

  Map<String, dynamic>? _parseRealtimeWeather(String? body) {
    if (body?.isEmpty ?? true) return null;
    return jsonDecode(body!);
  }
}
