import 'package:digitalstreich_app/weather/model/weather_daily.dart';
import 'package:digitalstreich_app/weather/model/weather_forecast.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather extends Equatable{

  Weather({required this.weatherDaily, required this.weatherForecast});

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);


  WeatherDaily weatherDaily;
  List<WeatherForecast> weatherForecast;



  Map<String, dynamic> toJson() => _$WeatherToJson(this);


  @override
  // TODO: implement props
  List<Object?> get props => [weatherDaily, weatherForecast];
}