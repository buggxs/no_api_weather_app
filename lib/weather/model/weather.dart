import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Weather extends Equatable{

  final String cityName;
  final double temperatureCelsius;

  Weather({
    required this.cityName,
    required this.temperatureCelsius
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    final weatherText = json['Headline']['Text'];
    print(json['DailyForecasts']['Temperature']['Minimum']['Value']);
    // weatherValue = (weatherValue-32)*5/9;
    print(weatherText);

    return Weather(cityName: 'Kassel', temperatureCelsius: 4.0);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [cityName, temperatureCelsius];
}