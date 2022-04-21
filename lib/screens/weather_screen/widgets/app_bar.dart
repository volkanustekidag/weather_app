import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app/blocs/weather_bloc/weather_event.dart';
import 'package:weather_app/screens/city_search_screen/city_search_home_screen.dart';

AppBar appBarBuild(BuildContext context) {
  return AppBar(
    title: Text("Weather"),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      IconButton(
          onPressed: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (buildContext) => SearhcCityScreen()))
                .then((value) {
              if (value != null) {
                BlocProvider.of<WeatherBloc>(context)
                    .add(WeatherEventRequested(woeid: value.woeid));
              }
            });
          },
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ))
    ],
  );
}
