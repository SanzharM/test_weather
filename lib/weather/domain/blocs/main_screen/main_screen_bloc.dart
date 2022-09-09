import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:portfoliome/weather/data/providers/main_screen_provider/main_screen_provider.dart';
import 'package:portfoliome/weather/domain/models/realtime_weather.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  final _provider = MainScreenProvider();

  void getRealtimeWeather() => add(GetRealtimeWeatherEvent());

  MainScreenBloc() : super(MainScreenInitial()) {
    on<GetRealtimeWeatherEvent>(_getRealtimeWeather);
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
      debugPrint('RealtimeWeather Bloc: $e');
      emit(RealtimeWeatherError('Something went wrong'));
    }
  }
}
