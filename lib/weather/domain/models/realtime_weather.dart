import 'dart:convert';

import 'package:portfoliome/weather/domain/models/location_data.dart';

class RealtimeWeather {
  final double? tempC;
  final double? tempF;
  final double? feelsLikeC;
  final double? feelsLikeF;
  final LocationData? locationData;

  const RealtimeWeather({
    this.tempC,
    this.tempF,
    this.feelsLikeC,
    this.feelsLikeF,
    this.locationData,
  });

  RealtimeWeather copyWith({
    double? tempC,
    double? tempF,
    double? feelsLikeC,
    double? feelsLikeF,
    LocationData? locationData,
  }) {
    return RealtimeWeather(
      tempC: tempC ?? this.tempC,
      tempF: tempF ?? this.tempF,
      feelsLikeC: feelsLikeC ?? this.feelsLikeC,
      feelsLikeF: feelsLikeF ?? this.feelsLikeF,
      locationData: locationData ?? this.locationData,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (tempC != null) {
      result.addAll({'tempC': tempC});
    }
    if (tempF != null) {
      result.addAll({'tempF': tempF});
    }
    if (feelsLikeC != null) {
      result.addAll({'feelsLikeC': feelsLikeC});
    }
    if (feelsLikeF != null) {
      result.addAll({'feelsLikeF': feelsLikeF});
    }
    if (locationData != null) {
      result.addAll({'locationData': locationData!.toMap()});
    }

    return result;
  }

  factory RealtimeWeather.fromMap(Map<String, dynamic> map) {
    return RealtimeWeather(
      tempC: map['current']['temp_c']?.toDouble(),
      tempF: map['current']['temp_f']?.toDouble(),
      feelsLikeC: map['current']['feelslike_c']?.toDouble(),
      feelsLikeF: map['current']['feelslike_f']?.toDouble(),
      locationData: map['locationData'] != null ? LocationData.fromMap(map['location']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RealtimeWeather.fromJson(String source) => RealtimeWeather.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RealtimeWeather(tempC: $tempC, tempF: $tempF, feelsLikeC: $feelsLikeC, feelsLikeF: $feelsLikeF, locationData: $locationData)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RealtimeWeather &&
        other.tempC == tempC &&
        other.tempF == tempF &&
        other.feelsLikeC == feelsLikeC &&
        other.feelsLikeF == feelsLikeF &&
        other.locationData == locationData;
  }

  @override
  int get hashCode {
    return tempC.hashCode ^ tempF.hashCode ^ feelsLikeC.hashCode ^ feelsLikeF.hashCode ^ locationData.hashCode;
  }
}