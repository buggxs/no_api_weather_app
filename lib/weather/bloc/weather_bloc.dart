import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:digitalstreich_app/weather/model/weather.dart';
import 'package:digitalstreich_app/weather/repository/weather_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {


  WeatherBloc() : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(
      WeatherEvent event
  ) async* {
    yield* event.applyAsync(bloc: this);
  }
}
