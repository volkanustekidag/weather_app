import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.search_off, size: 40, color: Colors.white),
        Text(
          "The city is not selected.",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        Text(
          "Please select a city.",
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ],
    ));
  }
}
