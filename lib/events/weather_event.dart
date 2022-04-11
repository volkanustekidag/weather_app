import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class WeatherEventRequested extends WeatherEvent {
  final int woeid;
  const WeatherEventRequested({@required this.woeid});

  @override
  List<Object> get props => [woeid];
}

class WeatherEventRefresh extends WeatherEvent {
  final int woeid;
  const WeatherEventRefresh({@required this.woeid});

  @override
  List<Object> get props => [woeid];
}
