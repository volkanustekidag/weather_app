import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/screens/weather_screen/widgets/condition_box_icon.dart';
import 'package:weather_icons/weather_icons.dart';

class SelectedWeather extends StatelessWidget {
  final weather, title;
  const SelectedWeather({Key key, this.weather, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 35),
          ),
          Text(
            DateFormat('EEEE').format(DateTime.parse(weather.applicableDate)),
            style: TextStyle(color: Colors.white),
          ),
          mapWeatherConditionToIcon(weatherCondition: weather.weatherCondition),
          Text(
            weather.weatherStateName,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text("Humidity: " + weather.humidity.toString() + "%",
              style: TextStyle(color: Colors.white, fontSize: 15)),
          Text("Pressure: " + weather.airPressure.toStringAsFixed(0) + "hPa",
              style: TextStyle(color: Colors.white, fontSize: 15)),
          Text("Wind: " + weather.windSpeed.toStringAsFixed(0) + "km",
              style: TextStyle(color: Colors.white, fontSize: 15)),
          Text(
            weather.maxTemp.toStringAsFixed(0) + "°",
            style: TextStyle(color: Colors.white, fontSize: 50),
          )
        ],
      ),
    );
  }
}
