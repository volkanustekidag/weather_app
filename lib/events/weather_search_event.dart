import 'package:equatable/equatable.dart';

abstract class WeatherSearchEvent extends Equatable {
  WeatherSearchEvent();
}

class WeatherSearchEventRequest extends WeatherSearchEvent {
  final query;

  WeatherSearchEventRequest({this.query});

  @override
  List<Object> get props => [query];
}
