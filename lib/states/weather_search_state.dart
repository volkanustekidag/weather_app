import 'package:equatable/equatable.dart';
import 'package:weather_app/models/location.dart';
import 'package:weather_app/models/weather.dart';

abstract class WeatherSearchState extends Equatable {
  WeatherSearchState();
  List<Object> get props => [];
}

class WeatherSearchStateInitial extends WeatherSearchState {
  @override
  List<Object> get props => [];
}

class WeatherSearchStateLoading extends WeatherSearchState {}

class WeatherSearchStateSucces extends WeatherSearchState {
  final List<Location> list;
  WeatherSearchStateSucces({this.list});
  @override
  List<Object> get props => [list];
}

class WeatherSearchStateFaiuler extends WeatherSearchState {}
