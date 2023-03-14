import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/src/core/presentation/theme.dart';
import 'package:weather/src/home/views/home_view.dart';
import 'package:weather/src/location/repository/location_repository.dart';
import 'package:weather/src/permission/bloc/permission_bloc.dart';
import 'package:weather/src/permission/repository/permission.dart';
import 'package:weather/src/weather/bloc/weather_bloc.dart';
import 'package:weather/src/weather/repository/weather_repository.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => PermissionRepository(),
        ),
        RepositoryProvider(
          create: (context) => LocationRepository(),
        ),
        RepositoryProvider(
          create: (context) => WeatherRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PermissionBloc(
              context.read<PermissionRepository>(),
            )..add(LocationPermissionRequested()),
            lazy: false,
          ),
          BlocProvider(
            create: (context) => WeatherBloc(
              context.read<LocationRepository>(),
              context.read<WeatherRepository>(),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter',
          debugShowCheckedModeBanner: false,
          theme: AppThemes.lightTheme,
          // darkTheme: AppThemes.darkTheme,
          home: const HomeView(),
        ),
      ),
    );
  }
}
