// ignore_for_file: false
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  const Weather({
    this.id = 0,
    this.name = '',
    this.data = WeatherData.empty,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  final int id;
  final String name;
  @JsonKey(name: 'main')
  final WeatherData data;

  static const empty = Weather();
}

@JsonSerializable()
class WeatherData {
  const WeatherData({
    this.temp = 0,
    this.feelsLike = 0,
    this.min = 0,
    this.max = 0,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);

  final double temp;
  @JsonKey(name: 'feels_like')
  final double feelsLike;
  @JsonKey(name: 'temp_min')
  final double min;
  @JsonKey(name: 'temp_max')
  final double max;

  static const empty = WeatherData();
}
