import 'package:json_annotation/json_annotation.dart';

part 'weather_forecast.g.dart';

@JsonSerializable()
class WeatherForecast {

  WeatherForecast({
    required this.date,
    required this.weatherForecastTemperature
  });

  factory WeatherForecast.fromJson(Map<String, dynamic> json) =>
    _$WeatherForecastFromJson(json);

  String date;
  WeatherForecastTemperature weatherForecastTemperature;

  Map<String, dynamic> toJson() => _$WeatherForecastToJson(this);



}

@JsonSerializable()
class WeatherForecastTemperature {
  WeatherForecastTemperature({required this.tempMin, required this.tempMax});

  factory WeatherForecastTemperature.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastTemperatureFromJson(json);

  TempMin tempMin;
  TempMax tempMax;

  Map<String, dynamic> toJson() => _$WeatherForecastTemperatureToJson(this);

}

@JsonSerializable()
class TempMin {

  TempMin({required this.value, required this.unit, required this.unitType});

  factory TempMin.fromJson(Map<String, dynamic> json) =>
    _$TempMinFromJson(json);

  double value;
  String unit;
  int unitType;

  Map<String, dynamic> toJson() => _$TempMinToJson(this);

}

@JsonSerializable()
class TempMax {

  TempMax({required this.value, required this.unit, required this.unitType});

  factory TempMax.fromJson(Map<String, dynamic> json) =>
      _$TempMaxFromJson(json);

  double value;
  String unit;
  int unitType;

  Map<String, dynamic> toJson() => _$TempMaxToJson(this);

}