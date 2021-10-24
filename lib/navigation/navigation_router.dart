import 'package:digitalstreich_app/weather/bloc/weather_bloc.dart';
import 'package:digitalstreich_app/weather/repository/weather_repository.dart';
import 'package:digitalstreich_app/weather/screen/weather_result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:digitalstreich_app/weather/screen/weather_screen.dart';

class NavigationRouter {

  final WeatherBloc _weatherBloc = WeatherBloc(FakeWeatherRepository());

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: _weatherBloc,
              child: const WeatherScreen(),
            )
        );
        break;
      case '/weather':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: _weatherBloc,
              child: const WeatherResultScreen(),
            )
        );
        break;
      default:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: _weatherBloc,
              child: const WeatherScreen(),
            )
        );
        break;
    }
  }

}