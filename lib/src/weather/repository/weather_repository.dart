import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/src/core/domain/endpoints.dart';
import 'package:weather/src/weather/models/weather.dart';

class WeatherRepository {
  Future<Weather> getWeather({
    required double lat,
    required double lon,
  }) async {
    try {
      final response = await http.get(
        Uri.parse('${EndPoints.weatherUrl}&lat=$lat&lon=$lon'),
      );

      final data = json.decode(response.body) as Map;
      final weather = Weather.fromJson(data as Map<String, dynamic>);
      return weather;
    } catch (e) {
      rethrow;
    }
  }
}
