// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherForecast _$WeatherForecastFromJson(Map<String, dynamic> json) =>
    WeatherForecast(
      date: json['Date'] as String,
      weatherForecastTemperature: WeatherForecastTemperature.fromJson(
          json['Temperature'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherForecastToJson(WeatherForecast instance) =>
    <String, dynamic>{
      'Date': instance.date,
      'Temperature': instance.weatherForecastTemperature,
    };

WeatherForecastTemperature _$WeatherForecastTemperatureFromJson(
        Map<String, dynamic> json) =>
    WeatherForecastTemperature(
      tempMin: TempMin.fromJson(json['Minimum'] as Map<String, dynamic>),
      tempMax: TempMax.fromJson(json['Maximum'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherForecastTemperatureToJson(
        WeatherForecastTemperature instance) =>
    <String, dynamic>{
      'Minimum': instance.tempMin,
      'Maximum': instance.tempMax,
    };

TempMin _$TempMinFromJson(Map<String, dynamic> json) => TempMin(
      value: (json['Value'] as num).toDouble(),
      unit: json['Unit'] as String,
      unitType: json['UnitType'] as int,
    );

Map<String, dynamic> _$TempMinToJson(TempMin instance) => <String, dynamic>{
      'Value': instance.value,
      'Unit': instance.unit,
      'UnitType': instance.unitType,
    };

TempMax _$TempMaxFromJson(Map<String, dynamic> json) => TempMax(
      value: (json['Value'] as num).toDouble(),
      unit: json['Unit'] as String,
      unitType: json['UnitType'] as int,
    );

Map<String, dynamic> _$TempMaxToJson(TempMax instance) => <String, dynamic>{
      'Value': instance.value,
      'Unit': instance.unit,
      'UnitType': instance.unitType,
    };
