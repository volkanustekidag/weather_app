import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app/blocs/weather_bloc_observer.dart';
import 'package:weather_app/blocs/weather_search_bloc/weather_search_bloc.dart';
import 'package:weather_app/blocs/weather_selection_bloc/weather_selection_bloc.dart';
import 'package:weather_app/repositories/weather_repository.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/screens/weather_screen/weather_home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

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
    return MultiBlocProvider(
        providers: [
          BlocProvider<WeatherBloc>(
            create: (context) =>
                WeatherBloc(weatherRepository: weatherRepository),
          ),
          BlocProvider<WeatherSearchBloc>(
            create: (context) => WeatherSearchBloc(weatherRepository),
          ),
          BlocProvider<WeatherSelectionBloc>(
            create: (context) => WeatherSelectionBloc(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: BlocProvider(
            create: (context) =>
                WeatherBloc(weatherRepository: weatherRepository),
            child: WeatherScreen(),
          ),
        ));
  }
}
