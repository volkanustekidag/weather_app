import 'package:flutter/material.dart';

class SearhcCityScreen extends StatefulWidget {
  const SearhcCityScreen({Key key}) : super(key: key);

  @override
  State<SearhcCityScreen> createState() => _SearhcCityScreenState();
}

class _SearhcCityScreenState extends State<SearhcCityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.grey,
              ))
        ],
      ),
      body: Container(),
    );
  }
}
