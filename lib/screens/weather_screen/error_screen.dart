import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
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
          "Something went wrong!",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ],
    ));
  }
}
