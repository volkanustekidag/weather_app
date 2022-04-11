import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather_search_bloc.dart';
import 'package:weather_app/events/weather_search_event.dart';
import 'package:weather_app/models/location.dart';
import 'package:weather_app/states/weather_search_state.dart';

class SearhcCityScreen extends StatefulWidget {
  const SearhcCityScreen({Key key}) : super(key: key);

  @override
  State<SearhcCityScreen> createState() => _SearhcCityScreenState();
}

class _SearhcCityScreenState extends State<SearhcCityScreen> {
  Completer<void> completer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        elevation: 0,
        actions: [
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 8, right: 8, left: 45, bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  onChanged: (value) {
                    if (value != "") {
                      BlocProvider.of<WeatherSearchBloc>(context)
                          .add(WeatherSearchEventRequest(query: value));
                    }
                  },
                  autofocus: true,
                  decoration: InputDecoration(
                      fillColor: Colors.red,
                      border: InputBorder.none,
                      hintText: " Search"),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: BlocConsumer<WeatherSearchBloc, WeatherSearchState>(
          builder: (context, state) {
            if (state is WeatherSearchStateLoading) {
              return Center(
                  child: CircularProgressIndicator(color: Colors.blue[100]));
            }

            if (state is WeatherSearchStateSucces) {
              final List<Location> list = state.list;
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pop(context, list[index]);
                    },
                    child: Card(
                      elevation: 0,
                      child: ListTile(title: Text(list[index].title)),
                    ),
                  );
                },
              );
            }

            if (state is WeatherSearchStateFaiuler) {
              Center(
                  child: Column(
                children: [
                  Icon(Icons.error, size: 40, color: Colors.blue[100]),
                  Text(
                    "Something went wrong!",
                    style: TextStyle(color: Colors.blue[100], fontSize: 30),
                  ),
                ],
              ));
            }

            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error, size: 40, color: Colors.blue[100]),
                Text(
                  "Select a city first.",
                  style: TextStyle(color: Colors.blue[100], fontSize: 30),
                ),
              ],
            ));
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}
