// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      weatherDaily:
          WeatherDaily.fromJson(json['Headline'] as Map<String, dynamic>),
      weatherForecast: (json['DailyForecasts'] as List<dynamic>)
          .map((e) => WeatherForecast.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'Headline': instance.weatherDaily,
      'DailyForecasts': instance.weatherForecast,
    };
