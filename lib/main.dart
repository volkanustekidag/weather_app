import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather_bloc.dart';
import 'package:weather_app/blocs/weather_bloc_observer.dart';
import 'package:weather_app/repositories/weather_repository.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/screens/city_search_screen.dart';
import 'package:weather_app/screens/weather_screen.dart';

void main() {
  final WeatherRepository weatherRepository =
      WeatherRepository(httpClient: http.Client());
  BlocOverrides.runZoned(
    () => runApp(MyApp(
      weatherRepository: weatherRepository,
    )),
    blocObserver: WeatherBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key, this.weatherRepository}) : super(key: key);
  final WeatherRepository weatherRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => WeatherBloc(weatherRepository: weatherRepository),
        child: WeatherScreen(),
      ),
    );
  }
}
