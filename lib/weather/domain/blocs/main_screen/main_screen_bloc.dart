import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:portfoliome/weather/data/providers/main_screen_provider/main_screen_provider.dart';
import 'package:portfoliome/weather/domain/models/astronomy.dart';
import 'package:portfoliome/weather/domain/models/realtime_weather.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  final _provider = MainScreenProvider();

  void getRealtimeWeather() => add(GetRealtimeWeatherEvent());
  void getAstronomy() => add(GetAstronomyEvent());
  void getData() => add(GetMainScreenDataEvent());

  MainScreenBloc() : super(MainScreenInitial()) {
    on<GetRealtimeWeatherEvent>(_getRealtimeWeather);
    on<GetAstronomyEvent>(_getAstronomy);
    on<GetMainScreenDataEvent>(_getMainScreenData);
  }

  void _getRealtimeWeather(MainScreenEvent event, Emitter<MainScreenState> emit) async {
    emit(RealtimeWeatherLoading());
    try {
      final location = await _provider.tryGetLocation();
      final response = await _provider.getRealtimeWeather(location?.locality);

      if (response.isSuccess) {
        emit(RealtimeWeatherLoaded(RealtimeWeather.fromMap(response.parsedJson!)));
        return;
      }
      emit(RealtimeWeatherError(response.error ?? 'Something went wrong'));
      return;
    } catch (e) {
      debugPrint('RealtimeWeather in MainBloc: $e');
      emit(RealtimeWeatherError('Something went wrong'));
    }
  }

  void _getAstronomy(MainScreenEvent event, Emitter<MainScreenState> emit) async {
    emit(AstronomyLoading());
    try {
      final location = await _provider.tryGetLocation();
      final response = await _provider.getAstronomy(location?.locality);

      if (response.isSuccess) {
        emit(AstronomyLoaded(Astronomy.fromMap(response.parsedJson!)));
        return;
      }
      emit(AstronomyError(response.error ?? 'Something went wrong'));
      return;
    } catch (e) {
      debugPrint('Astronomy in MainBloc: $e');
      emit(AstronomyError('Something went wrong'));
    }
  }

  void _getMainScreenData(MainScreenEvent event, Emitter<MainScreenState> emit) async {
    emit(MainScreenDataLoading());
    try {
      final location = await _provider.tryGetLocation();
      final weatherResponse = await _provider.getRealtimeWeather(location?.locality);
      final astronomyResponse = await _provider.getAstronomy(location?.locality);

      if (weatherResponse.isSuccess && astronomyResponse.isSuccess) {
        emit(
          MainScreenDataLoaded(
            weather: RealtimeWeather.fromMap(weatherResponse.parsedJson!),
            astronomy: Astronomy.fromMap(astronomyResponse.parsedJson!),
          ),
        );
        return;
      }
      emit(MainScreenDataError(weatherResponse.error ?? astronomyResponse.error ?? 'Something went wrong'));
      return;
    } catch (e) {
      debugPrint('GetMainScreenData error: $e');
      emit(MainScreenDataError('Something went wrong'));
    }
  }
}
