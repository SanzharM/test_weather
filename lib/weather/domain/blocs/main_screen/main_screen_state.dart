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

class AstronomyLoading extends MainScreenState {}

class AstronomyLoaded extends MainScreenState {
  final Astronomy astronomy;
  AstronomyLoaded(this.astronomy);
}

class AstronomyError extends MainScreenState {
  final String error;
  AstronomyError(this.error);
}

class MainScreenDataLoaded extends MainScreenState {
  final RealtimeWeather weather;
  final Astronomy astronomy;
  MainScreenDataLoaded({required this.weather, required this.astronomy});
}

class MainScreenDataLoading extends MainScreenState {}

class MainScreenDataError extends MainScreenState {
  final String error;
  MainScreenDataError(this.error);
}
