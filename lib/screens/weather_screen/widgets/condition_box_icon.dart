import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_icons/weather_icons.dart';

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
