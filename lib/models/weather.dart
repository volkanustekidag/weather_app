import 'package:equatable/equatable.dart';

class Weather {
  List<ConsolidatedWeather> consolidatedWeather;
  String title;
  String locationType;
  int woeid;
  String lattLong;
  String timezone;

  Weather(
      {this.consolidatedWeather,
      this.title,
      this.locationType,
      this.woeid,
      this.lattLong,
      this.timezone});

  Weather.fromJson(Map<String, dynamic> json) {
    if (json['consolidated_weather'] != null) {
      consolidatedWeather = <ConsolidatedWeather>[];
      json['consolidated_weather'].forEach((v) {
        consolidatedWeather.add(new ConsolidatedWeather.fromJson(v));
      });
    }
    title = json['title'];
    locationType = json['location_type'];
    woeid = json['woeid'];
    lattLong = json['latt_long'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.consolidatedWeather != null) {
      data['consolidated_weather'] =
          this.consolidatedWeather.map((v) => v.toJson()).toList();
    }
    data['title'] = this.title;
    data['location_type'] = this.locationType;
    data['woeid'] = this.woeid;
    data['latt_long'] = this.lattLong;
    data['timezone'] = this.timezone;
    return data;
  }
}

class ConsolidatedWeather {
  int id;
  String weatherStateName;

  WeatherCondition weatherCondition;
  String windDirectionCompass;
  String created;
  String applicableDate;
  double minTemp;
  double maxTemp;
  double theTemp;
  double windSpeed;
  double windDirection;
  double airPressure;
  int humidity;
  double visibility;
  int predictability;

  ConsolidatedWeather(
      {this.id,
      this.weatherStateName,
      this.weatherCondition,
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

  ConsolidatedWeather.fromJson(Map<String, dynamic> json) {
    weatherCondition = _mapStringToWeatherCondition(json['weather_state_abbr']);
    weatherStateName = json['weather_state_name'];
    id = json['id'];
    windDirectionCompass = json['wind_direction_compass'];
    created = json['created'];
    applicableDate = json['applicable_date'];
    minTemp = json['min_temp'];
    maxTemp = json['max_temp'];
    theTemp = json['the_temp'];
    windSpeed = json['wind_speed'];
    windDirection = json['wind_direction'];
    airPressure = json['air_pressure'];
    humidity = json['humidity'];
    visibility = json['visibility'];
    predictability = json['predictability'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['wind_direction_compass'] = this.windDirectionCompass;
    data['created'] = this.created;
    data['applicable_date'] = this.applicableDate;
    data['min_temp'] = this.minTemp;
    data['max_temp'] = this.maxTemp;
    data['the_temp'] = this.theTemp;
    data['wind_speed'] = this.windSpeed;
    data['wind_direction'] = this.windDirection;
    data['air_pressure'] = this.airPressure;
    data['humidity'] = this.humidity;
    data['visibility'] = this.visibility;
    data['predictability'] = this.predictability;
    return data;
  }

  static WeatherCondition _mapStringToWeatherCondition(String inputString) {
    Map<String, WeatherCondition> map = {
      'sn': WeatherCondition.snow,
      'sl': WeatherCondition.sleet,
      'h': WeatherCondition.hail,
      't': WeatherCondition.thunderstorm,
      'hr': WeatherCondition.heavyRain,
      'lr': WeatherCondition.lightRain,
      's': WeatherCondition.showers,
      'hc': WeatherCondition.heavyCloud,
      'lc': WeatherCondition.lightCloud,
      'c': WeatherCondition.clear
    };
    return map[inputString] ?? WeatherCondition.unknown;
  }
}

enum WeatherCondition {
  snow,
  sleet,
  hail,
  thunderstorm,
  heavyRain,
  lightRain,
  showers,
  heavyCloud,
  lightCloud,
  clear,
  unknown
}

/*
enum WeatherCondition {
  snow,
  sleet,
  hail,
  thunderstorm,
  heavyRain,
  lightRain,
  showers,
  heavyCloud,
  lightCloud,
  clear,
  unknown
}

class Weather extends Equatable {
  final WeatherCondition weatherCondition;
  final String formattedCondition;
  final double minTemp;
  final double temp;
  final double maxTemp;
  final int locationId;
  final String created;
  final DateTime lastUpdated;
  final String location;
  //constructor
  const Weather({
    this.weatherCondition,
    this.formattedCondition,
    this.minTemp,
    this.temp,
    this.maxTemp,
    this.locationId,
    this.created,
    this.lastUpdated,
    this.location,
  });
  @override
  // TODO: implement props
  List<Object> get props => [
        weatherCondition,
        formattedCondition,
        minTemp,
        temp,
        maxTemp,
        locationId,
        created,
        lastUpdated,
        location,
      ];
  //convert from JSON to Weather object
/*
consolidated_weather": [
    {
      "id": 5001437304061952,
      "weather_state_name": "Light Cloud",
      "weather_state_abbr": "lc",
      "wind_direction_compass": "SSE",
      "created": "2020-07-26T00:22:18.967978Z",
      "applicable_date": "2020-07-25",
      "min_temp": 22.825,
      "max_temp": 31.585,
      "the_temp": 32.2,
      "wind_speed": 4.388510937739601,
      "wind_direction": 165.1056162097894,
      "air_pressure": 1018.5,
      "humidity": 56,
      "visibility": 15.249070428696413,
      "predictability": 70
    },
    ...
 */
  factory Weather.fromJson(dynamic jsonObject) {
    final consolidatedWeather = jsonObject['consolidated_weather'][0];
    return Weather(
        weatherCondition: _mapStringToWeatherCondition(
                consolidatedWeather['weather_state_abbr']) ??
            '',
        formattedCondition: consolidatedWeather['weather_state_name'] ?? '',
        minTemp: consolidatedWeather['min_temp'] as double,
        temp: consolidatedWeather['the_temp'] as double,
        maxTemp: consolidatedWeather['max_temp'] as double,
        locationId:
            jsonObject['woeid'] as int, //Where On Earth Identifier = woeid
        created: consolidatedWeather['created'],
        lastUpdated: DateTime.now(),
        location: jsonObject['title']);
  }

  static WeatherCondition _mapStringToWeatherCondition(String inputString) {
    Map<String, WeatherCondition> map = {
      'sn': WeatherCondition.snow,
      'sl': WeatherCondition.sleet,
      'h': WeatherCondition.hail,
      't': WeatherCondition.thunderstorm,
      'hr': WeatherCondition.heavyRain,
      'lr': WeatherCondition.lightRain,
      's': WeatherCondition.showers,
      'hc': WeatherCondition.heavyCloud,
      'lc': WeatherCondition.lightCloud,
      'c': WeatherCondition.clear
    };
    return map[inputString] ?? WeatherCondition.unknown;
  }
} */
