import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Weather extends Equatable{

  final String cityName;
  final double temperatureCelsius;

  Weather({
    required this.cityName,
    required this.temperatureCelsius
  });

  @override
  // TODO: implement props
  List<Object?> get props => [cityName, temperatureCelsius];
}