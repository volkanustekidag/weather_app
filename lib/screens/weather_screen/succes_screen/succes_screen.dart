import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app/blocs/weather_bloc/weather_event.dart';
import 'package:weather_app/blocs/weather_search_bloc/weather_search_bloc.dart';
import 'package:weather_app/blocs/weather_search_bloc/weather_search_state.dart';
import 'package:weather_app/blocs/weather_selection_bloc/weather_selection_bloc.dart';
import 'package:weather_app/blocs/weather_selection_bloc/weather_selection_event.dart';
import 'package:weather_app/blocs/weather_selection_bloc/weather_selection_state.dart';
import 'package:weather_app/models/location.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/screens/weather_screen/succes_screen/selected_weather.dart';
import 'package:weather_icons/weather_icons.dart';

class SuccesScreen extends StatelessWidget {
  final weather, location;

  const SuccesScreen({Key key, this.weather, this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        final state = BlocProvider.of<WeatherSearchBloc>(context).state;
        if (state is WeatherSearchStateSelectedCity) {
          Location location = state.location;
          BlocProvider.of<WeatherBloc>(context)
              .add(WeatherEventRefresh(woeid: location.woeid));
        }
      },
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              BlocBuilder<WeatherSelectionBloc, WeatherSelectionState>(
                builder: (context, state) {
                  if (state is WeatherOnSelectedState) {
                    final consolidatedWeather = state.consolidatedWeather;
                    return SelectedWeather(
                      weather: consolidatedWeather,
                      title: weather.title,
                    );
                  }
                  return SelectedWeather(
                    weather: weather.consolidatedWeather[0],
                    title: weather.title,
                  );
                },
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: weather.consolidatedWeather.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        BlocProvider.of<WeatherSelectionBloc>(context).add(
                            WeatherOnSelectedEvent(
                                consolidatedWeather:
                                    weather.consolidatedWeather[index]));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                DateFormat('EEE').format(DateTime.parse(weather
                                    .consolidatedWeather[index]
                                    .applicableDate)),
                                style: TextStyle(color: Colors.black),
                              ),
                              mapWeatherConditionToIcon(
                                  weatherCondition: weather
                                      .consolidatedWeather[index]
                                      .weatherCondition),
                              Text(weather.consolidatedWeather[index].maxTemp
                                      .toStringAsFixed(0) +
                                  "°")
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  BoxedIcon mapWeatherConditionToIcon({WeatherCondition weatherCondition}) {
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