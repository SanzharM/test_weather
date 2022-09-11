import 'dart:convert';

import 'package:portfoliome/weather/domain/models/location_data.dart';

class RealtimeWeather {
  final double? tempC;
  final double? tempF;
  final double? feelsLikeC;
  final double? feelsLikeF;
  final LocationData? locationData;
  final String? condition;
  final double? windKph;
  final double? pressureMb;
  final double? humidity;
  final double? visibilityKm;

  const RealtimeWeather({
    this.tempC,
    this.tempF,
    this.feelsLikeC,
    this.feelsLikeF,
    this.locationData,
    this.condition,
    this.windKph,
    this.pressureMb,
    this.humidity,
    this.visibilityKm,
  });

  RealtimeWeather copyWith({
    double? tempC,
    double? tempF,
    double? feelsLikeC,
    double? feelsLikeF,
    LocationData? locationData,
    String? condition,
    double? windKph,
    double? pressureMb,
    double? humidity,
    double? visibilityKm,
  }) {
    return RealtimeWeather(
      tempC: tempC ?? this.tempC,
      tempF: tempF ?? this.tempF,
      feelsLikeC: feelsLikeC ?? this.feelsLikeC,
      feelsLikeF: feelsLikeF ?? this.feelsLikeF,
      locationData: locationData ?? this.locationData,
      condition: condition ?? this.condition,
      windKph: windKph ?? this.windKph,
      pressureMb: pressureMb ?? this.pressureMb,
      humidity: humidity ?? this.humidity,
      visibilityKm: visibilityKm ?? this.visibilityKm,
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
    if (condition != null) {
      result.addAll({'condition': condition});
    }
    if (windKph != null) {
      result.addAll({'windKph': windKph});
    }
    if (pressureMb != null) {
      result.addAll({'pressureMb': pressureMb});
    }
    if (humidity != null) {
      result.addAll({'humidity': humidity});
    }
    if (visibilityKm != null) {
      result.addAll({'visibilityKm': visibilityKm});
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
      condition: map['current']['condition']['text'],
      windKph: map['current']['wind_kph']?.toDouble(),
      pressureMb: map['current']['pressure_mb']?.toDouble(),
      humidity: map['current']['humidity']?.toDouble(),
      visibilityKm: map['current']['vis_km']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory RealtimeWeather.fromJson(String source) => RealtimeWeather.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RealtimeWeather(tempC: $tempC, tempF: $tempF, feelsLikeC: $feelsLikeC, feelsLikeF: $feelsLikeF, locationData: $locationData, condition: $condition, windKph: $windKph, pressureMb: $pressureMb, humidity: $humidity, visibilityKm: $visibilityKm)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RealtimeWeather &&
        other.tempC == tempC &&
        other.tempF == tempF &&
        other.feelsLikeC == feelsLikeC &&
        other.feelsLikeF == feelsLikeF &&
        other.locationData == locationData &&
        other.condition == condition &&
        other.windKph == windKph &&
        other.pressureMb == pressureMb &&
        other.humidity == humidity &&
        other.visibilityKm == visibilityKm;
  }

  @override
  int get hashCode {
    return tempC.hashCode ^
        tempF.hashCode ^
        feelsLikeC.hashCode ^
        feelsLikeF.hashCode ^
        locationData.hashCode ^
        condition.hashCode ^
        windKph.hashCode ^
        pressureMb.hashCode ^
        humidity.hashCode ^
        visibilityKm.hashCode;
  }
}
