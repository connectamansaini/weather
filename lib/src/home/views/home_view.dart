import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/src/permission/bloc/permission_bloc.dart';
import 'package:weather/src/weather/bloc/weather_bloc.dart';
import 'package:weather/src/weather/views/weather_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocConsumer<PermissionBloc, PermissionState>(
        listener: (context, state) {
          if (state.locationStatus == PermissionStatus.granted) {
            context.read<WeatherBloc>().add(WeatherRequested());
          }
        },
        builder: (context, state) {
          if (state.locationStatus == PermissionStatus.granted) {
            return const WeatherView();
          } else {
            return const Center(
              child: Text('You Have Denied the Location Permission'),
            );
          }
        },
      ),
    );
  }
}
