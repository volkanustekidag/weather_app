import 'package:flutter/material.dart';
import 'package:weather_app/blocs/weather_bloc/weather_event.dart';
import 'package:weather_app/blocs/weather_bloc/weather_state.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/repositories/weather_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({@required this.weatherRepository})
      : super(WeatherStateInitial()) {
    on<WeatherEventRequested>((event, emit) async {
      emit(WeatherStateLoading());
      try {
        final Weather weather =
            await weatherRepository.fetchWeather(event.woeid);
        emit(WeatherStateSucces(weather: weather));
      } catch (e) {
        emit(WeatherStateFailure());
      }
    });

    on<WeatherEventRefresh>((event, emit) async {
      emit(WeatherStateLoading());
      try {
        final Weather weather =
            await weatherRepository.fetchWeather(event.woeid);
        emit(WeatherStateSucces(weather: weather));
      } catch (e) {
        emit(WeatherStateFailure());
      }
    });
  }
}
