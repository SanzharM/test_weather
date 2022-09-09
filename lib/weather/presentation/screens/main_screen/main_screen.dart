import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfoliome/weather/domain/blocs/main_screen/main_screen_bloc.dart';
import 'package:portfoliome/weather/domain/models/realtime_weather.dart';

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
    final bloc = context.read<MainScreenBloc>()..getRealtimeWeather();
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
                  if (state is RealtimeWeatherLoading) const CircularProgressIndicator.adaptive(),
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
