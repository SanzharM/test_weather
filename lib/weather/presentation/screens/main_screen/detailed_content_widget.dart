import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfoliome/core/constants/constants.dart';
import 'package:portfoliome/weather/domain/models/realtime_weather.dart';
import 'package:portfoliome/weather/presentation/widgets/cards/info_card.dart';

class DetailedContentWidget extends StatelessWidget {
  const DetailedContentWidget({Key? key, this.weather}) : super(key: key);

  final RealtimeWeather? weather;

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(AppConstraints.padding * 2),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppConstraints.padding,
        mainAxisSpacing: AppConstraints.padding,
      ),
      children: [
        InfoCard(
          leading: Icon(CupertinoIcons.drop_fill, color: AppColors.white.withOpacity(0.9), size: 18.0),
          title: 'Humidity',
          child: Text(
            ' ${weather?.humidity ?? '--'} %',
            style: Theme.of(context).textTheme.titleLarge?.apply(color: AppColors.white),
          ),
        ),
        InfoCard(
          leading: Icon(CupertinoIcons.wind, color: AppColors.white.withOpacity(0.9), size: 18.0),
          title: 'Wind',
          child: Text(
            ' ${weather?.windKph ?? '--'} km/h',
            style: Theme.of(context).textTheme.titleLarge?.apply(color: AppColors.white),
          ),
        ),
        InfoCard(
          leading: Icon(CupertinoIcons.eye_fill, color: AppColors.white.withOpacity(0.9), size: 18.0),
          title: 'Visibility',
          child: Text(
            ' ${weather?.visibilityKm ?? '--'} km',
            style: Theme.of(context).textTheme.titleLarge?.apply(color: AppColors.white),
          ),
        ),
        InfoCard(
          leading: Icon(CupertinoIcons.speedometer, color: AppColors.white.withOpacity(0.9), size: 18.0),
          title: 'Pressure',
          child: Container(
            padding: const EdgeInsets.all(4.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.white.withOpacity(0.9)),
            ),
            child: Text(
              '${weather?.pressureMb ?? '--'} \nGPa',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.apply(color: AppColors.white),
            ),
          ),
        ),
      ],
    );
  }
}
