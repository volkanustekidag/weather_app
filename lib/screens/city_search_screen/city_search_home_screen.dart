import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/blocs/weather_search_bloc/weather_search_bloc.dart';
import 'package:weather_app/blocs/weather_search_bloc/weather_search_event.dart';
import 'package:weather_app/models/location.dart';
import 'package:weather_app/blocs/weather_search_bloc/weather_search_state.dart';
import 'package:weather_app/screens/city_search_screen/error_screen.dart';
import 'package:weather_app/screens/city_search_screen/initial_screen.dart';
import 'package:weather_app/screens/city_search_screen/loading_screen.dart';
import 'package:weather_app/screens/city_search_screen/list_screen.dart';
import 'package:weather_app/screens/city_search_screen/widgets/app_bar.dart';

class SearhcCityScreen extends StatefulWidget {
  const SearhcCityScreen({Key key}) : super(key: key);

  @override
  State<SearhcCityScreen> createState() => _SearhcCityScreenState();
}

class _SearhcCityScreenState extends State<SearhcCityScreen> {
  Completer<void> completer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        color: Colors.white,
        child: BlocConsumer<WeatherSearchBloc, WeatherSearchState>(
          builder: (context, state) {
            if (state is WeatherSearchStateLoading) {
              return LoadingScreen();
            }

            if (state is WeatherSearchStateSucces) {
              final List<Location> list = state.list;
              return SuccesScreen(
                list: list,
              );
            }

            if (state is WeatherSearchStateFaiuler) {
              return ErrorScreen();
            }

            return InitialScreen();
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}
