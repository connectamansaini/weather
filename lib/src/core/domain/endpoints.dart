class EndPoints {
  const EndPoints._();
  static const baseUrl = 'https://api.openweathermap.org/data/2.5/weather/';
  static const apiKey = '797ee5c5d88ededb5d3b0fdf1c466f59';
  static const unit = 'metric';

  static const weatherUrl = '$baseUrl?appid=$apiKey&units=$unit';
}
