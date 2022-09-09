import 'package:flutter/material.dart';
import 'package:portfoliome/core/constants/app_constraints.dart';
import 'package:portfoliome/weather/domain/models/realtime_weather.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({Key? key, this.weather}) : super(key: key);

  final RealtimeWeather? weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(AppConstraints.padding),
      child: Text(
        '${weather?.tempC ?? '~'} C',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
