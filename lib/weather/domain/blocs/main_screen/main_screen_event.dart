part of 'main_screen_bloc.dart';

@immutable
abstract class MainScreenEvent {}

class GetRealtimeWeatherEvent extends MainScreenEvent {}

class GetAstronomyEvent extends MainScreenEvent {}
