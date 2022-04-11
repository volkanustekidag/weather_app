import 'package:equatable/equatable.dart';
import 'package:weather_app/models/weather.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
  List<Object> get props => [];
}

class WeatherStateInitial extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherStateLoading extends WeatherState {}

class WeatherStateSucces extends WeatherState {
  final Weather weather;
  const WeatherStateSucces({this.weather});

  List<Object> get probs => [weather];
}

class WeatherStateFailure extends WeatherState {}
