import 'package:equatable/equatable.dart';
import 'package:weather_app/models/weather.dart';

abstract class WeatherSelectionEvent extends Equatable {}

class WeatherOnSelectedEvent extends WeatherSelectionEvent {
  final ConsolidatedWeather consolidatedWeather;

  WeatherOnSelectedEvent({this.consolidatedWeather});

  @override
  List<Object> get props => [];
}

class WeatherOnSelectedIsEmptyEvent extends WeatherSelectionEvent {
  @override
  List<Object> get props => [];
}
