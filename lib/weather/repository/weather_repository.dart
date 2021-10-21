import 'dart:convert';
import 'dart:math';

import 'package:digitalstreich_app/weather/model/weather.dart';
import 'package:http/http.dart' as http;

abstract class WeatherRepository {

  Future<Weather> fetchWeather(String cityName);
}

class FakeWeatherRepository implements WeatherRepository {
  @override
  Future<Weather> fetchWeather(String cityName) {
    return Future.delayed(
      const Duration(seconds: 1),
        () async {
          
          final response = await streamWeather("168717");

          Weather.fromJson(jsonDecode(response.body));

          return Weather(
              cityName: cityName,
              temperatureCelsius: 20.0
          );
        }
    );
  }


  Future<http.Response> streamWeather(String cityKey) {
    return http.post(
      Uri.parse('http://dataservice.accuweather.com/forecasts/v1/daily/1day/$cityKey?apikey=Uyc554AP2iMWUrnxMpuKVneQ5DMkQnmA&language=de-de'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
  }

}

class NetworkException implements Exception {
}