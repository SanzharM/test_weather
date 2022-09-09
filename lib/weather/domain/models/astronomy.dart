import 'dart:convert';

import 'package:portfoliome/core/services/utils.dart';

class Astronomy {
  final DateTime? sunrise;
  final DateTime? sunset;
  final DateTime? moonrise;
  final DateTime? moonset;

  const Astronomy({
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
  });

  Astronomy copyWith({
    DateTime? sunrise,
    DateTime? sunset,
    DateTime? moonrise,
    DateTime? moonset,
  }) {
    return Astronomy(
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
      moonrise: moonrise ?? this.moonrise,
      moonset: moonset ?? this.moonset,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (sunrise != null) {
      result.addAll({'sunrise': sunrise!.millisecondsSinceEpoch});
    }
    if (sunset != null) {
      result.addAll({'sunset': sunset!.millisecondsSinceEpoch});
    }
    if (moonrise != null) {
      result.addAll({'moonrise': moonrise!.millisecondsSinceEpoch});
    }
    if (moonset != null) {
      result.addAll({'moonset': moonset!.millisecondsSinceEpoch});
    }

    return result;
  }

  factory Astronomy.fromMap(Map<String, dynamic> map) {
    return Astronomy(
      sunrise: map['astronomy']['astro']['sunrise'] != null ? Utils.parseTimeFromAMorPM(map['astronomy']['astro']['sunrise']) : null,
      sunset: map['astronomy']['astro']['sunset'] != null ? Utils.parseTimeFromAMorPM(map['astronomy']['astro']['sunset']) : null,
      moonrise: map['astronomy']['astro']['moonrise'] != null ? Utils.parseTimeFromAMorPM(map['astronomy']['astro']['moonrise']) : null,
      moonset: map['astronomy']['astro']['moonset'] != null ? Utils.parseTimeFromAMorPM(map['astronomy']['astro']['moonset']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Astronomy.fromJson(String source) => Astronomy.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Astronomy(sunrise: $sunrise, sunset: $sunset, moonrise: $moonrise, moonset: $moonset)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Astronomy &&
        other.sunrise == sunrise &&
        other.sunset == sunset &&
        other.moonrise == moonrise &&
        other.moonset == moonset;
  }

  @override
  int get hashCode {
    return sunrise.hashCode ^ sunset.hashCode ^ moonrise.hashCode ^ moonset.hashCode;
  }
}
