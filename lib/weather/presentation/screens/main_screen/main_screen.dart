import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:portfoliome/core/constants/app_colors.dart';
import 'package:portfoliome/core/constants/app_constraints.dart';
import 'package:portfoliome/weather/domain/blocs/main_screen/main_screen_bloc.dart';
import 'package:portfoliome/weather/domain/models/astronomy.dart';
import 'package:portfoliome/weather/domain/models/location_data.dart';
import 'package:portfoliome/weather/domain/models/realtime_weather.dart';
import 'package:portfoliome/weather/presentation/screens/main_screen/astronomy_widget.dart';
import 'package:portfoliome/weather/presentation/widgets/custom_shimmer.dart';
import 'package:portfoliome/weather/presentation/widgets/tag_icon.dart';

import 'current_weather_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MainScreenBloc>(); // ..getAstronomy(); // ..getRealtimeWeather();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.settings_solid),
          ),
        ],
      ),
      body: SafeArea(
        child: CupertinoScrollbar(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              const SliverToBoxAdapter(
                child: CurrentWeather(
                  weather: RealtimeWeather(
                    tempC: 29.0,
                    locationData: LocationData(name: 'Almaty'),
                    condition: 'Partly cloudy',
                    feelsLikeC: 32,
                  ),
                ),
              ),
              SliverFillRemaining(
                fillOverscroll: true,
                hasScrollBody: false,
                child: Container(
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    borderRadius: AppConstraints.borderRadiusTLR,
                    color: AppColors.white,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 4.0),
                      const TagIcon(),
                      const SizedBox(height: AppConstraints.padding),
                      SizedBox(
                        height: 100,
                        child: BlocBuilder<MainScreenBloc, MainScreenState>(
                          bloc: bloc,
                          builder: (context, state) {
                            return CustomShimmer(
                              isLoading: state is AstronomyLoading,
                              child: AstronomyWidget(
                                astronomy: state is AstronomyLoaded ? state.astronomy : null,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return Scaffold(
      body: BlocConsumer<MainScreenBloc, MainScreenState>(
        bloc: bloc,
        listener: (_, state) {
          // isLoading = state is RealtimeWeatherLoading;

          // if (state is RealtimeWeatherError) {
          //   debugPrint('state is ${state.error}');
          // }

          // if (state is RealtimeWeatherLoaded) {
          //   _weather = state.realtimeWeather;
          // }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  if (state is RealtimeWeatherLoaded) CurrentWeather(weather: state.realtimeWeather),
                  if (state is RealtimeWeatherLoading)
                    const SizedBox(
                      height: 64,
                      width: 64,
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  if (state is RealtimeWeatherError) Text(state.error),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
