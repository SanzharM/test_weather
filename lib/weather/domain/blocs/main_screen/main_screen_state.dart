part of 'main_screen_bloc.dart';

@immutable
abstract class MainScreenState {}

class MainScreenInitial extends MainScreenState {}

class RealtimeWeatherLoading extends MainScreenState {}

class RealtimeWeatherLoaded extends MainScreenState {
  final RealtimeWeather realtimeWeather;
  RealtimeWeatherLoaded(this.realtimeWeather);
}

class RealtimeWeatherError extends MainScreenState {
  final String error;
  RealtimeWeatherError(this.error);
}
