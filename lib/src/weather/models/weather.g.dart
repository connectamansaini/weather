// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      data: json['main'] == null
          ? WeatherData.empty
          : WeatherData.fromJson(json['main'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'main': instance.data,
    };

WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) => WeatherData(
      temp: (json['temp'] as num?)?.toDouble() ?? 0,
      feelsLike: (json['feels_like'] as num?)?.toDouble() ?? 0,
      min: (json['temp_min'] as num?)?.toDouble() ?? 0,
      max: (json['temp_max'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$WeatherDataToJson(WeatherData instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'temp_min': instance.min,
      'temp_max': instance.max,
    };
