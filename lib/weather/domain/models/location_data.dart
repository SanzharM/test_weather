import 'dart:convert';

class LocationData {
  final String? name;
  final String? country;
  final double? lat;
  final double? lng;
  final DateTime? localTime;

  const LocationData({
    this.name,
    this.country,
    this.lat,
    this.lng,
    this.localTime,
  });

  LocationData copyWith({
    String? name,
    String? country,
    double? lat,
    double? lng,
    DateTime? localTime,
  }) {
    return LocationData(
      name: name ?? this.name,
      country: country ?? this.country,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      localTime: localTime ?? this.localTime,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (name != null) {
      result.addAll({'name': name});
    }
    if (country != null) {
      result.addAll({'country': country});
    }
    if (lat != null) {
      result.addAll({'lat': lat});
    }
    if (lng != null) {
      result.addAll({'lng': lng});
    }
    if (localTime != null) {
      result.addAll({'localTime': localTime!.millisecondsSinceEpoch});
    }

    return result;
  }

  factory LocationData.fromMap(Map<String, dynamic> map) {
    return LocationData(
      name: map['name'],
      country: map['country'],
      lat: map['lat']?.toDouble(),
      lng: map['lon']?.toDouble(),
      localTime: map['localtime'] != null ? DateTime.fromMillisecondsSinceEpoch(map['localtime']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationData.fromJson(String source) => LocationData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LocationData(name: $name, country: $country, lat: $lat, lng: $lng, localTime: $localTime)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LocationData &&
        other.name == name &&
        other.country == country &&
        other.lat == lat &&
        other.lng == lng &&
        other.localTime == localTime;
  }

  @override
  int get hashCode {
    return name.hashCode ^ country.hashCode ^ lat.hashCode ^ lng.hashCode ^ localTime.hashCode;
  }
}
