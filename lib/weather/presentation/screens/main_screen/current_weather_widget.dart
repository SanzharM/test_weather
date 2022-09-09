import 'package:flutter/material.dart';
import 'package:portfoliome/core/constants/constants.dart';
import 'package:portfoliome/weather/domain/models/realtime_weather.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({Key? key, this.weather}) : super(key: key);

  final RealtimeWeather? weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        // image: DecorationImage(
        //   image: NetworkImage(''),
        //   alignment: Alignment.bottomCenter,
        // ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: AppConstraints.padding * 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weather?.locationData?.name ?? '',
            style: Theme.of(context).textTheme.headlineSmall?.apply(color: AppColors.secondary),
          ),
          const SizedBox(height: 8.0),
          Text(
            '${weather?.tempC ?? '--'}°',
            style: Theme.of(context).textTheme.headlineLarge?.apply(color: AppColors.secondary),
          ),
          const SizedBox(height: 16.0),
          if (weather?.condition?.isNotEmpty ?? false) ...[
            Text(
              weather!.condition!,
              style: Theme.of(context).textTheme.titleSmall?.apply(color: AppColors.secondary),
            ),
          ],
          if (weather?.feelsLikeC != null) ...[
            const SizedBox(height: 8.0),
            Text(
              'Feels like ${weather!.feelsLikeC}°',
              style: Theme.of(context).textTheme.bodyMedium?.apply(color: AppColors.secondary),
            ),
          ],
        ],
      ),
    );
  }
}
