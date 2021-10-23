import 'package:json_annotation/json_annotation.dart';

part 'weather_daily.g.dart';

@JsonSerializable()
class WeatherDaily {

  WeatherDaily({ required this.effectiveDate, required this.severity, required this.text, required this.category,
    required this.endDate});

  factory WeatherDaily.fromJson(Map<String, dynamic> json) =>
    _$WeatherDailyFromJson(json);

  String effectiveDate;
  int severity;
  String text;
  String category;
  String endDate;


  Map<String, dynamic> toJson() => _$WeatherDailyToJson(this);
}