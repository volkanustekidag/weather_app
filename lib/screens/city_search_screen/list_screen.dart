import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather_search_bloc/weather_search_bloc.dart';
import 'package:weather_app/blocs/weather_search_bloc/weather_search_event.dart';

class SuccesScreen extends StatelessWidget {
  final list;
  const SuccesScreen({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              BlocProvider.of<WeatherSearchBloc>(context)
                  .add(WeatherSearchEventSelectedCity(list[index]));
              Navigator.pop(context, list[index]);
            },
            child: Card(
              elevation: 0,
              child: ListTile(title: Text(list[index].title)),
            ),
          );
        },
      ),
    );
  }
}
