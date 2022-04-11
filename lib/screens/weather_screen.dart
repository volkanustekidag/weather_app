import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather_bloc.dart';
import 'package:weather_app/events/weather_event.dart';
import 'package:weather_app/states/weather_state.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Completer<void> completer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<WeatherBloc>(context).add(WeatherEventRefresh(city: "los"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Weather"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CitySearchDelegate());
              },
              icon: Icon(
                Icons.search,
                color: Colors.grey,
              ))
        ],
      ),
      body: Center(
          child: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is WeatherStateLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WeatherStateSucces) {
            final weather = state.weather;
            print(weather.location);
            return RefreshIndicator(
              onRefresh: () {
                BlocProvider.of<WeatherBloc>(context)
                    .add(WeatherEventRefresh(city: "los"));
                return completer.future;
              },
              child: Container(
                color: Colors.white,
                child: ListView(
                  children: <Widget>[Text(weather.location)],
                ),
              ),
            );
          }
          if (state is WeatherStateFailure) {
            return Text("Something went wrong!");
          }
          return Center(
            child: Text("Select a location first"),
          );
        },
      )),
    );
  }
}

class CitySearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) => [];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, null), icon: Icon(Icons.arrow_back));

  @override
  Widget buildResults(BuildContext context) => Container();

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> sug = [
      "Los",
      "Los",
      "Los",
    ];

    return ListView.builder(
      itemCount: sug.length,
      itemBuilder: (context, index) {
        final sugg = sug[index];
        return ListTile(
          title: Text(sugg),
        );
      },
    );
  }
}
