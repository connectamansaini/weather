import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/src/weather/bloc/weather_bloc.dart';
import 'package:weather/src/weather/views/widgets/weather_success_page.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state.status == Status.failure) {
              return const Center(
                child: Text('Failure'),
              );
            } else if (state.status == Status.success) {
              return WeatherSuccessPage(
                weather: state.weather,
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
