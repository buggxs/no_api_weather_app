import 'package:digitalstreich_app/navigation/navigation_router.dart';
import 'package:digitalstreich_app/weather/bloc/weather_bloc.dart';
import 'package:digitalstreich_app/weather/cubit/weather_cubit.dart';
import 'package:digitalstreich_app/weather/repository/weather_repository.dart';
import 'package:digitalstreich_app/weather/screen/weather_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(
    navigationRouter: NavigationRouter(),
  ));
}

class MyApp extends StatelessWidget {

  final NavigationRouter navigationRouter;

  const MyApp({
    Key? key,
    required this.navigationRouter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WeatherBloc(FakeWeatherRepository()),
        ),
      ],
      child: MaterialApp(
        title: 'My Weather App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        onGenerateRoute: navigationRouter.onGenerateRoute,
      ),
    );
  }
}
