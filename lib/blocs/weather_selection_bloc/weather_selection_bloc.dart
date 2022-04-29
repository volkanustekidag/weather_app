import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather_selection_bloc/weather_selection_event.dart';
import 'package:weather_app/blocs/weather_selection_bloc/weather_selection_state.dart';

class WeatherSelectionBloc
    extends Bloc<WeatherSelectionEvent, WeatherSelectionState> {
  WeatherSelectionBloc() : super(WeatherInitialState()) {
    on<WeatherOnSelectedEvent>((event, emit) {
      emit(WeatherOnSelectedState(
          consolidatedWeather: event.consolidatedWeather));
    });

    on<WeatherOnSelectedIsEmptyEvent>((event, emit) {
      emit(WeatherOnSelectedIsEmptyState());
    });
  }
}
