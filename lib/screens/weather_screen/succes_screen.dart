import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app/blocs/weather_bloc/weather_event.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_icons/weather_icons.dart';

class SuccesScreen extends StatelessWidget {
  final weather, location;

  const SuccesScreen({Key key, this.weather, this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<WeatherBloc>(context)
            .add(WeatherEventRefresh(woeid: location.woeid));
      },
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
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
                        weatherCondition:
                            weather.consolidatedWeather[0].weatherCondition),
                    Column(
                      children: [
                        Text(
                            "Humidity: " +
                                weather.consolidatedWeather[0].humidity
                                    .toString() +
                                "%",
                            style:
                                TextStyle(color: Colors.white, fontSize: 15)),
                        Text(
                            "Pressure: " +
                                weather.consolidatedWeather[0].airPressure
                                    .toStringAsFixed(0) +
                                "hPa",
                            style:
                                TextStyle(color: Colors.white, fontSize: 15)),
                        Text(
                            "Wind: " +
                                weather.consolidatedWeather[0].windSpeed
                                    .toStringAsFixed(0) +
                                "km",
                            style:
                                TextStyle(color: Colors.white, fontSize: 15)),
                        Text(
                          weather.consolidatedWeather[0].maxTemp
                                  .toStringAsFixed(0) +
                              "°",
                          style: TextStyle(color: Colors.white, fontSize: 50),
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
                            Text(weather.consolidatedWeather[index].maxTemp
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
      ),
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
