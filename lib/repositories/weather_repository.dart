import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather.dart';

const baseUrl = 'https://www.metaweather.com/';
final locationUrl = (city) => "${baseUrl}/api/location/search/?query=${city}";
final weatherUrl = (locationId) => "${baseUrl}/api/location/${locationId}";

class WeatherRepository {
  final http.Client httpClient;

  WeatherRepository({@required this.httpClient});

  Future<List> getLocationIdFromCity(String city) async {
    final response = await this.httpClient.get(Uri.parse(locationUrl(city)));
    if (response.statusCode == 200) {
      print("oldu");
      final cities = jsonDecode(response.body) as List;
      print((cities.first['woeid']));
      print((cities.first['title']));

      return cities;
    } else if (response.statusCode != 200) {
      print("olmadı");
      throw Exception('Error getting location id of :' + city);
    }
  }

  Future<Weather> fetchWeather(int location) async {
    final response = await this.httpClient.get(Uri.parse(weatherUrl(location)));
    if (response.statusCode == 200) {
      final weatherJson = jsonDecode(response.body);
      print("oldu");
      return Weather.fromJson(weatherJson);
    } else {
      print("olmadı");
      throw Exception('Error getting location id of :' + location.toString());
    }
  }

  Future<Weather> getWeatherFromCity(String city) async {
    final List locationId = await getLocationIdFromCity(city);
    return fetchWeather(locationId.first['woeid']);
  }
}
