// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_daily.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDaily _$WeatherDailyFromJson(Map<String, dynamic> json) => WeatherDaily(
      effectiveDate: json['EffectiveDate'] as String,
      severity: json['Severity'] as int,
      text: json['Text'] as String,
      category: json['Category'] as String,
      endDate: json['EndDate'] as String,
    );

Map<String, dynamic> _$WeatherDailyToJson(WeatherDaily instance) =>
    <String, dynamic>{
      'EffectiveDate': instance.effectiveDate,
      'Severity': instance.severity,
      'Text': instance.text,
      'Category': instance.category,
      'EndDate': instance.endDate,
    };
