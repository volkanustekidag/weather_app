import 'package:flutter/material.dart';

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
        Icon(Icons.error, size: 40, color: Colors.white),
        Text(
          "Select a city first.",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ],
    ));
  }
}
