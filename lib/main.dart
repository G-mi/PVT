import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(59.334591, 18.063240),
    zoom: 11.5,
  ); // Camera Position

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: _initialCameraPosition,
      ),
    );
  }
}
