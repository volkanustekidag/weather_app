import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather_search_bloc/weather_search_bloc.dart';
import 'package:weather_app/blocs/weather_search_bloc/weather_search_event.dart';
import 'package:weather_app/blocs/weather_selection_bloc/weather_selection_bloc.dart';
import 'package:weather_app/blocs/weather_selection_bloc/weather_selection_event.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.indigo[100],
    elevation: 0,
    actions: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 8, right: 8, left: 45, bottom: 8),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: TextField(
              onChanged: (value) {
                if (value != "") {
                  BlocProvider.of<WeatherSearchBloc>(context)
                      .add(WeatherSearchEventRequest(query: value));

                  BlocProvider.of<WeatherSelectionBloc>(context)
                      .add(WeatherOnSelectedIsEmptyEvent());
                }
              },
              autofocus: true,
              decoration: InputDecoration(
                  fillColor: Colors.red,
                  border: InputBorder.none,
                  hintText: " Search"),
            ),
          ),
        ),
      ),
    ],
  );
}
