part of 'weather_bloc.dart';

enum Status { initial, loading, failure, success }

class WeatherState {
  const WeatherState({
    this.status = Status.initial,
    this.weather = Weather.empty,
  });

  final Status status;
  final Weather weather;

  WeatherState copyWith({
    Status? status,
    Weather? weather,
  }) {
    return WeatherState(
      status: status ?? this.status,
      weather: weather ?? this.weather,
    );
  }
}
