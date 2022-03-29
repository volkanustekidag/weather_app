import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final int id;
  final String weatherStateName;
  final String weatherStateAbbr;
  final String windDirectionCompass;
  final String created;
  final String applicableDate;
  final double minTemp;
  final double maxTemp;
  final double theTemp;
  final double windSpeed;
  final double windDirection;
  final int airPressure;
  final int humidity;
  final double visibility;
  final int predictability;

  const Weather(
      {this.id,
      this.weatherStateName,
      this.weatherStateAbbr,
      this.windDirectionCompass,
      this.created,
      this.applicableDate,
      this.minTemp,
      this.maxTemp,
      this.theTemp,
      this.windSpeed,
      this.windDirection,
      this.airPressure,
      this.humidity,
      this.visibility,
      this.predictability});

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
