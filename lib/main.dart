import 'package:flutter/material.dart';
import 'startscreen.dart';
import 'signin.dart';
import 'Buttons.dart';


void main() {
  runApp(
    MaterialApp(
      title: 'TennisMatch',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => StartScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => SignIn(),
      },
    ),
  );
}