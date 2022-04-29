import 'package:equatable/equatable.dart';
import 'package:weather_app/models/weather.dart';

abstract class WeatherSelectionState extends Equatable {}

class WeatherInitialState extends WeatherSelectionState {
  @override
  List<Object> get props => [];
}

class WeatherOnSelectedState extends WeatherSelectionState {
  final ConsolidatedWeather consolidatedWeather;

  WeatherOnSelectedState({this.consolidatedWeather});

  @override
  List<Object> get props => [consolidatedWeather];
}

class WeatherOnSelectedIsEmptyState extends WeatherSelectionState {
  @override
  List<Object> get props => throw UnimplementedError();
}
