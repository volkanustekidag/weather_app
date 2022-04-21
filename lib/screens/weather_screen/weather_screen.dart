import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app/blocs/weather_bloc/weather_state.dart';
import 'package:weather_app/screens/weather_screen/widgets/app_bar.dart';
import 'package:weather_app/screens/weather_screen/error_screen.dart';
import 'package:weather_app/screens/weather_screen/initial_screen.dart';
import 'package:weather_app/screens/weather_screen/loading_screen.dart';
import 'package:weather_app/screens/weather_screen/succes_screen.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  var val;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.blue[100],
      appBar: appBarBuild(context),
      body: Container(
          child: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is WeatherStateLoading) {
            return LoadingScreen();
          }
          if (state is WeatherStateSucces) {
            final weather = state.weather;
            return SuccesScreen(
              weather: weather,
              location: val,
            );
          }
          if (state is WeatherStateFailure) {
            return ErrorScreen();
          }
          return InitialScreen();
        },
      )),
    );
  }
}
