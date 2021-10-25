part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {

  WeatherEvent();

  Stream<WeatherState> applyAsync({WeatherBloc? bloc});

}

class GetWeather extends WeatherEvent {
  final cityName;

  final WeatherRepository _weatherRepository = FakeWeatherRepository();

  GetWeather(this.cityName);

  @override
  Stream<WeatherState> applyAsync({WeatherBloc? bloc}) async* {
    try {
      yield WeatherLoading();
      final weather = await _weatherRepository.fetchWeather(cityName);
      yield WeatherLoaded(weather);
    } on NetworkException {
      yield WeatherError("Couldn't fetch weather. Is the device online?");
    }
  }

}