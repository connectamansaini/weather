// ignore_for_file: false
import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:weather/src/location/repository/location_repository.dart';
import 'package:weather/src/weather/models/weather.dart';
import 'package:weather/src/weather/repository/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc(
    this.locationRepository,
    this.weatherRepository,
  ) : super(const WeatherState()) {
    on<WeatherEvent>(_onWeatherRequested);
  }

  final LocationRepository locationRepository;
  final WeatherRepository weatherRepository;

  Future<void> _onWeatherRequested(
    WeatherEvent event,
    Emitter<WeatherState> emit,
  ) async {
    try {
      emit(state.copyWith(status: Status.loading));

      final location = await locationRepository.getCurrentLocation();

      final weather = await weatherRepository.getWeather(
        lat: location.latitude,
        lon: location.longitude,
      );

      emit(
        state.copyWith(
          status: Status.success,
          weather: weather,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: Status.failure));
    }
  }
}
