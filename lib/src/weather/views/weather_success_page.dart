import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/src/core/presentation/theme.dart';
import 'package:weather/src/core/presentation/widgets/spacing.dart';
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
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: getImage(weather),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  DateFormat('EEEE,dd LLLL').format(
                    DateTime.fromMillisecondsSinceEpoch(
                      weather.dateTime * 1000,
                    ),
                  ),
                  style: Theme.of(context).mediumTitlePrimaryTextStyle,
                ),
                Text(
                  DateFormat('hh:mm a').format(
                    DateTime.fromMillisecondsSinceEpoch(
                      weather.dateTime * 1000,
                    ),
                  ),
                  style: Theme.of(context).smallTitlePrimaryTextStyle,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.location_on),
                    Text(weather.description[0].description)
                  ],
                ),
                Text(
                  weather.name,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).largeTitlePrimaryTextStyle,
                ),
                const Spacing(),
                Text(
                  ' ${weather.data.temp.toInt()}° ',
                  style: Theme.of(context)
                      .largeTitlePrimaryTextStyle
                      .copyWith(fontSize: 140),
                ),
                Text(
                  'Feels like ${weather.data.feelsLike.toInt()}°',
                  style: Theme.of(context).smallTitleSecondaryTextStyle,
                ),
                const Spacing(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Low: ${weather.data.min.toInt()}°',
                      style: Theme.of(context).smallTitleSecondaryTextStyle,
                    ),
                    const Spacing(
                      isVertical: false,
                      size: SpacingSize.medium,
                    ),
                    Text(
                      'High: ${weather.data.max.toInt()}°',
                      style: Theme.of(context).smallTitleSecondaryTextStyle,
                    ),
                  ],
                ),
              ],
            ),
            const Spacing(),
          ],
        ),
      ),
    );
  }

  AssetImage getImage(Weather weather) {
    final weatherTime =
        DateTime.fromMillisecondsSinceEpoch(weather.dateTime * 1000);
    final hours = weatherTime.hour;
    log(hours.toString());
    if (hours >= 6 && hours < 14) {
      //Morning
      return const AssetImage('assets/images/Morning.png');
    } else if (hours >= 14 && hours <= 21) {
      //Evening
      return const AssetImage('assets/images/Evening.png');
    } else {
      //night
      return const AssetImage('assets/images/Night.png');
    }
  }
}
