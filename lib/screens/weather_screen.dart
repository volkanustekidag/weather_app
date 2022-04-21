import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app/blocs/weather_bloc/weather_event.dart';
import 'package:weather_app/blocs/weather_bloc/weather_state.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/screens/city_search_screen.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Completer<void> completer;

  String FtoC(num f) {
    return ((f - 32) * 5 / 9).toStringAsFixed(0);
  }

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
            return Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          }
          if (state is WeatherStateSucces) {
            final weather = state.weather;
            return RefreshIndicator(
              onRefresh: () {
                BlocProvider.of<WeatherBloc>(context)
                    .add(WeatherEventRefresh(woeid: 2442047));
                return completer.future;
              },
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            weather.title,
                            style: TextStyle(color: Colors.white, fontSize: 35),
                          ),
                          Text(
                            weather.consolidatedWeather[0].weatherStateName,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          _mapWeatherConditionToIcon(
                              weatherCondition: weather
                                  .consolidatedWeather[0].weatherCondition),
                          Column(
                            children: [
                              Text(
                                  "Humidity: " +
                                      weather.consolidatedWeather[0].humidity
                                          .toString() +
                                      "%",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15)),
                              Text(
                                  "Pressure: " +
                                      weather.consolidatedWeather[0].airPressure
                                          .toStringAsFixed(0) +
                                      "hPa",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15)),
                              Text(
                                  "Wind: " +
                                      weather.consolidatedWeather[0].windSpeed
                                          .toStringAsFixed(0) +
                                      "km",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15)),
                              Text(
                                weather.consolidatedWeather[0].maxTemp
                                        .toStringAsFixed(0) +
                                    "°",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 50),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ListView.builder(
                        itemCount: weather.consolidatedWeather.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                children: <Widget>[
                                  _mapWeatherConditionToIcon(
                                      weatherCondition: weather
                                          .consolidatedWeather[index]
                                          .weatherCondition),
                                  Text(weather
                                          .consolidatedWeather[index].maxTemp
                                          .toStringAsFixed(0) +
                                      "°")
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          if (state is WeatherStateFailure) {
            return Center(
                child: Column(
              children: [
                Icon(Icons.error, size: 40, color: Colors.white),
                Text(
                  "Something went wrong!",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ],
            ));
          }
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error, size: 40, color: Colors.white),
              Text(
                "Select a city first.",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ],
          ));
        },
      )),
    );
  }

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

  BoxedIcon _mapWeatherConditionToIcon({WeatherCondition weatherCondition}) {
    switch (weatherCondition) {
      case WeatherCondition.clear:
      case WeatherCondition.lightCloud:
        return BoxedIcon(
          WeatherIcons.day_sunny,
          size: 80,
        );
        break;
      case WeatherCondition.hail:
      case WeatherCondition.snow:
      case WeatherCondition.sleet:
        return BoxedIcon(
          WeatherIcons.snow,
          color: Colors.black,
          size: 80,
        );
        break;
      case WeatherCondition.heavyCloud:
        return BoxedIcon(
          WeatherIcons.cloud_up,
          color: Colors.black,
          size: 80,
        );
        break;
      case WeatherCondition.heavyRain:
      case WeatherCondition.lightRain:
      case WeatherCondition.showers:
        return BoxedIcon(
          WeatherIcons.rain,
          size: 80,
          color: Colors.black,
        );
        break;
      case WeatherCondition.thunderstorm:
        return BoxedIcon(
          WeatherIcons.thunderstorm,
          color: Colors.black,
          size: 80,
        );
        break;
      case WeatherCondition.unknown:
        return BoxedIcon(
          WeatherIcons.sunset,
          color: Colors.black,
          size: 80,
        );
        break;
    }
    return BoxedIcon(
      WeatherIcons.sunset,
      color: Colors.black,
      size: 80,
    );
  }
}
