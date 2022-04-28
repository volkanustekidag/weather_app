import 'package:equatable/equatable.dart';
import 'package:weather_app/models/weather.dart';

abstract class WeatherSelectionState extends Equatable {}

class WeatherInitialState extends Equatable {
  @override
  List<Object> get props => [];
}

class WeatherOnSelectedState extends Equatable {
  final ConsolidatedWeather consolidatedWeather;

  WeatherOnSelectedState({this.consolidatedWeather});

  @override
  List<Object> get props => [consolidatedWeather];
}
