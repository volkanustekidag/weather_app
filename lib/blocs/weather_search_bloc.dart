import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/events/weather_search_event.dart';
import 'package:weather_app/models/location.dart';
import 'package:weather_app/repositories/weather_repository.dart';
import 'package:weather_app/states/weather_search_state.dart';

class WeatherSearchBloc extends Bloc<WeatherSearchEvent, WeatherSearchState> {
  final WeatherRepository weatherRepository;

  WeatherSearchBloc(@required this.weatherRepository)
      : super(WeatherSearchStateInitial()) {
    on<WeatherSearchEventRequest>((event, emit) async {
      emit(WeatherSearchStateLoading());

      try {
        final List<Location> locationList =
            await weatherRepository.getLocationIdFromCity(event.query);
        emit(WeatherSearchStateSucces(list: locationList));
      } catch (e) {
        emit(WeatherSearchStateFaiuler());
      }
    });
  }
}
