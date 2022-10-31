// ignore_for_file: false
import 'package:flutter/material.dart';
import 'package:weather/src/core/presentation/layout/constants.dart';

import 'package:weather/src/core/presentation/style/typography.dart';
import 'package:weather/src/weather/models/weather.dart';

class WeatherSuccessPage extends StatelessWidget {
  const WeatherSuccessPage({
    super.key,
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          color: Colors.white,
          icon: const Icon(
            Icons.near_me,
            size: 35,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            color: Colors.white,
            icon: const Icon(
              Icons.search,
              size: 35,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: Constants.base * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Temperature is ${weather.data.temp.toInt()}°',
                  style: AppTypography.temperatureTextStyle,
                ),
                Text(
                  'Feels like ${weather.data.feelsLike.toInt()}°',
                  style: AppTypography.temperatureTextStyle,
                ),
                Text(
                  'Min ${weather.data.min.toInt()}°',
                  style: AppTypography.temperatureTextStyle,
                ),
                Text(
                  'Max ${weather.data.feelsLike.toInt()}°',
                  style: AppTypography.temperatureTextStyle,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 15, 15),
            child: Text(
              'In ${weather.name}',
              textAlign: TextAlign.right,
              style: AppTypography.messageTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
