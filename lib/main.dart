import 'package:flutter/material.dart';
import 'package:frontend/Loading.dart';
import 'User.dart';
import 'UserPreferences.dart';
import 'startscreen.dart';
import 'signin.dart';



void main() async {





  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TennisMatch',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => Loading(),
        // When navigating to the "/second" route, build the SecondScreen widget.

      },
    ),
  );
}