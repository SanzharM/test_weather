import 'package:flutter/cupertino.dart';

class Utils {
  static DateTime? parseTimeFromAMorPM(String? time) {
    if (time == null || time.isEmpty) return null;
    try {
      final rawTime = time.split(' ').first;
      final isAM = time.split(' ').last.endsWith('AM');
      final now = DateTime.now();
      return DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(rawTime.split(':').first) + (isAM ? 0 : 12),
        int.parse(rawTime.split(':').last),
      );
    } catch (e) {
      debugPrint('Unable to parse time $time: $e');
    }
    return null;
  }

  static String toTemperature(dynamic value) {
    return '${value ?? '--'}°';
  }
}
