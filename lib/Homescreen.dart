import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/Buttons.dart';
import 'package:frontend/Plannedmatches.dart';
import 'package:frontend/Settings.dart';
import 'package:frontend/Profile.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget{
  HomeScreen({Key key}) : super(key:key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {
  String text;
  Completer<GoogleMapController> _controller = Completer();
  static const  LatLng _center = const LatLng(59.286621, 18.088187);
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;

  _onMapCreated(GoogleMapController controller){
    _controller.complete(controller);
  }

  _onCameraMove(CameraPosition position){
    _lastMapPosition = position.target;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: Text('Tennis Match'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:  <Widget>[
            //Todo: image, fullname, username
            //Todo: implement screens and link
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () { Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Settings()));
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () { Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Profile()));
                
              },
            ),
            ListTile(
              leading: Icon(Icons.sports_tennis),
              title: Text('Planned matches'),
              onTap: () { Navigator.push(
                  context, MaterialPageRoute(builder: (_) => PlannedMatches()));
              },
            ),
            ListTile(
              leading: Icon(Icons.chat),
              title: Text('Chat'),
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Friends'),
            ),
             //todo: implement sign out, move to bottom of screen.
             CustomIconButton(onPressed: () {  Navigator.pop(context);
             },
               title: text = 'Sign out',
               color: Colors.deepOrange,)
          ],
          ),
        ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target:_center, zoom:12.5),
            mapType: _currentMapType,
            //markers: _markers,
            onCameraMove: _onCameraMove,
            )
        ]
      ),

      drawerEnableOpenDragGesture: true,
      );



  }
}