import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather_selection_bloc/weather_selection_event.dart';
import 'package:weather_app/blocs/weather_selection_bloc/weather_selection_state.dart';

class WeatherSelectionBloc
    extends Bloc<WeatherSelectionEvent, WeatherSelectionState> {
  WeatherSelectionBloc(WeatherSelectionState initialState)
      : super(initialState) {
    on<WeatherOnSelectedEvent>((event, emit) {});
  }
}
