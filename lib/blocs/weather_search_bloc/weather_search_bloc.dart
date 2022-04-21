import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/blocs/weather_search_bloc/weather_search_event.dart';
import 'package:weather_app/models/location.dart';
import 'package:weather_app/repositories/weather_repository.dart';
import 'package:weather_app/blocs/weather_search_bloc/weather_search_state.dart';

class WeatherSearchBloc extends Bloc<WeatherSearchEvent, WeatherSearchState> {
  final WeatherRepository weatherRepository;

  WeatherSearchBloc(this.weatherRepository)
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

    on<WeatherSearchEventSelectedCity>((event, emit) {
      emit(WeatherSearchStateSelectedCity(event.location));
    });
  }
}
