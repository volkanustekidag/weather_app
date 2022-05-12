import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/screens/weather_screen/widgets/weather_condition_svg.dart';

class SelectedWeather extends StatelessWidget {
  final weather, title;
  const SelectedWeather({Key key, this.weather, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.only(top: 80.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.95,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 35),
              ),
              Text(
                DateFormat('EEEE')
                    .format(DateTime.parse(weather.applicableDate)),
                style: TextStyle(color: Colors.white),
              ),
              mapWeatherConditionToIcon(
                  weatherCondition: weather.weatherCondition),
              Text(
                weather.weatherStateName,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              /* Text("Humidity: " + weather.humidity.toString() + "%",
                  style: TextStyle(color: Colors.white, fontSize: 15)),
              Text("Pressure: " + weather.airPressure.toStringAsFixed(0) + "hPa",
                  style: TextStyle(color: Colors.white, fontSize: 15)),
              Text("Wind: " + weather.windSpeed.toStringAsFixed(0) + "km",
                  style: TextStyle(color: Colors.white, fontSize: 15)),*/
              Text(
                weather.maxTemp.toStringAsFixed(0) + "°",
                style: TextStyle(color: Colors.white, fontSize: 50),
              )
            ],
          ),
        ),
      ),
    );
  }
}
