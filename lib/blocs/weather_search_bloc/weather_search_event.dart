import 'package:equatable/equatable.dart';
import 'package:weather_app/models/location.dart';

abstract class WeatherSearchEvent extends Equatable {
  WeatherSearchEvent();
}

class WeatherSearchEventRequest extends WeatherSearchEvent {
  final query;

  WeatherSearchEventRequest({this.query});

  @override
  List<Object> get props => [query];
}

class WeatherSearchEventSelectedCity extends WeatherSearchEvent {
  final Location location;

  WeatherSearchEventSelectedCity(this.location);

  @override
  List<Object> get props => [location];
}
