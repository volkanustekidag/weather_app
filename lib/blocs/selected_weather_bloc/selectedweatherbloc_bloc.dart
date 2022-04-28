import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'selectedweatherbloc_event.dart';
part 'selectedweatherbloc_state.dart';

class SelectedweatherblocBloc extends Bloc<SelectedweatherblocEvent, SelectedweatherblocState> {
  SelectedweatherblocBloc() : super(SelectedweatherblocInitial()) {
    on<SelectedweatherblocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
