import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_icons/weather_icons.dart';

SvgPicture mapWeatherConditionToIcon({WeatherCondition weatherCondition}) {
  switch (weatherCondition) {
    case WeatherCondition.clear:
    case WeatherCondition.lightCloud:
      return SvgPicture.asset(
        'assets/svg/sunny.svg',
        height: 100,
        width: 100,
      );
      break;
    case WeatherCondition.lightCloud:
      return SvgPicture.asset(
        'assets/svg/light_cloud.svg',
        height: 100,
        width: 100,
      );
      break;
    case WeatherCondition.hail:
    case WeatherCondition.snow:
    case WeatherCondition.sleet:
      return SvgPicture.asset(
        'assets/svg/snowy.svg',
        height: 100,
        width: 100,
      );
      break;
    case WeatherCondition.heavyCloud:
      return SvgPicture.asset(
        'assets/svg/cloudy.svg',
        height: 100,
        width: 100,
      );
      break;
    case WeatherCondition.heavyRain:
    case WeatherCondition.lightRain:
    case WeatherCondition.showers:
      return SvgPicture.asset(
        'assets/svg/rainy.svg',
        height: 100,
        width: 100,
      );
      break;
    case WeatherCondition.showers:
      return SvgPicture.asset(
        'assets/svg/showers.svg',
        height: 100,
        width: 100,
      );
      break;
    case WeatherCondition.thunderstorm:
      return SvgPicture.asset(
        'assets/svg/thunder.svg',
        height: 100,
        width: 100,
      );
      break;
    case WeatherCondition.unknown:
      return SvgPicture.asset(
        'assets/svg/sunny.svg',
        height: 100,
        width: 100,
      );
      break;
  }
  return SvgPicture.asset(
    'assets/svg/sunny.svg',
    height: 100,
    width: 100,
  );
}
