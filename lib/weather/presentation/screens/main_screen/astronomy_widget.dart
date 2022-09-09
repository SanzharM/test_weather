import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:portfoliome/core/constants/constants.dart';
import 'package:portfoliome/weather/domain/models/astronomy.dart';

class AstronomyWidget extends StatelessWidget {
  const AstronomyWidget({Key? key, this.astronomy}) : super(key: key);

  final Astronomy? astronomy;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AstronomyItemWidget(
            icon: const Icon(CupertinoIcons.sunrise),
            time: astronomy?.sunrise == null ? '--:--' : DateFormat('HH:mm').format(astronomy!.sunrise!),
          ),
          const SizedBox(width: AppConstraints.padding),
          AstronomyItemWidget(
            icon: const Icon(CupertinoIcons.sunset),
            time: astronomy?.sunset == null ? '--:--' : DateFormat('HH:mm').format(astronomy!.sunset!),
          ),
          const SizedBox(width: AppConstraints.padding),
          AstronomyItemWidget(
            icon: const Icon(CupertinoIcons.moon_fill),
            time: astronomy?.moonrise == null ? '--:--' : DateFormat('HH:mm').format(astronomy!.moonrise!),
          ),
          const SizedBox(width: AppConstraints.padding),
          AstronomyItemWidget(
            icon: const Icon(CupertinoIcons.moon_zzz_fill),
            time: astronomy?.moonset == null ? '--:--' : DateFormat('HH:mm').format(astronomy!.moonset!),
          ),
        ],
      ),
    );
  }
}

class AstronomyItemWidget extends StatelessWidget {
  const AstronomyItemWidget({Key? key, required this.time, this.icon}) : super(key: key);

  final String time;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConstraints.padding),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey, width: 0.5),
        borderRadius: AppConstraints.borderRadius,
        color: AppColors.primary.withOpacity(0.2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (icon != null) icon!,
          Flexible(
            child: Text(
              time,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelMedium?.apply(color: AppColors.secondary),
            ),
          ),
        ],
      ),
    );
  }
}
