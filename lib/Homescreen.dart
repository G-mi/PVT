import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/Buttons.dart';
import 'package:frontend/Match.dart';
import 'dart:convert';
import 'package:frontend/Plannedmatches.dart';
import 'package:frontend/Settings.dart';
import 'package:frontend/Profile.dart';
import 'package:frontend/UserPreferences.dart';
import 'package:frontend/CreateMatchDialog.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'MatchInfo.dart';
import 'startscreen.dart';
import 'User.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget{
  HomeScreen({Key key}) : super(key:key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {
  String text;
  User user = UserPreferences.getUser();
  Completer<GoogleMapController> _controller = Completer();
  static const  LatLng _center = const LatLng(59.334591, 18.063240);
  GoogleMapsPlaces _tennisCourts = GoogleMapsPlaces(apiKey: "AIzaSyBx8eSPRpBYjI2jL5BJNdgFupMUf5cae_Y");
  Set<Marker> _markers = <Marker>{};
  List<PlacesSearchResult> places = [];
  Set<Marker> _matchMarkers = <Marker>{};
  Map<LatLng, Match> matches;


  _onMapCreated(GoogleMapController controller){
    _controller.complete(controller);
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

             CustomIconButton(  onPressed: () => _handleSignOut(),
               title: text = 'Sign out',
               color: Colors.deepOrange,)
          ],
          ),
        ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            mapToolbarEnabled: false,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 12,
            ),
            onMapCreated: _onMapCreated,
            markers: Set<Marker>.of(_markers),
          ),
          Align(
            alignment: Alignment(-0.9, 0.9),
            child: SizedBox(
              width: 40,
              height: 40,
              child: ClipOval(
                child: Container(
                  color: Colors.deepOrange,
                  child:  IconButton(
                    icon: Icon(Icons.search),
                    iconSize: 25,
                    color: Colors.white,
                    onPressed: () {
                      searchTennisCourts(_center);
                    },
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.9, 0.9),
            child: SizedBox(
              width: 40,
              height: 40,
              child: ClipOval(
                child: Container(
                  color: Colors.deepOrange,
                  child:  IconButton(
                    icon: Icon(Icons.add),
                    iconSize: 25,
                    color: Colors.white,
                    onPressed: () async {
                      final Match newMatch = await showDialog(
                      context: context,
                      builder: (BuildContext context) => CreateMatchDialog()
                        );
                    /* if (newMatch != null) {
                       setState(() {
                         _updateMarker(newMatch);
                       });
                     }*/
                    },
                  ),
                ),
              ),
            ),
          ),
        ]
      ),

      drawerEnableOpenDragGesture: true,
      );
  }

  void _handleTap(Match match) {
    showDialog(
        context: context,
        builder: (_) => MatchInfo(match: match,));
  }

  void searchTennisCourts(LatLng center) async {
    setState(() {
      _markers.clear();
    });

    final location = Location(lat: _center.latitude, lng: _center.longitude);
    final result = await _tennisCourts.searchNearbyWithRadius(location, 8000, keyword: "tennisbana");

    setState(() {
      this.places = result.results;
      result.results.forEach((f)  {
        Marker marker = Marker(
          markerId: MarkerId(f.name),
          draggable: false,
          infoWindow: InfoWindow(title: f.name, snippet: f.vicinity),
          position: LatLng(f.geometry.location.lat, f.geometry.location.lng),
        );
        _markers.add(marker);
        _markers.addAll(_matchMarkers);
      });
    });
  }

  void _updateMarker(Match match) {
    setState(() {
      Marker marker = Marker(
          markerId: MarkerId(match.matchLocation.toString()),
          draggable: false,
          infoWindow: InfoWindow(
            title: 'Match',
            snippet: match.matchLocation.toString(),
          ),
          position: LatLng(match.matchLocation.latitude + 0.00001, match.matchLocation.longitude + 0.00001),
          icon: BitmapDescriptor.defaultMarkerWithHue(300.0),
          onTap: () {
            _handleTap(match);
          }
      );

      _matchMarkers.add(marker);
      _markers.addAll(_matchMarkers);
    });
  }

  void _handleSignOut() async {

    UserPreferences.deleteUser(user);
     Navigator.push(
      context, MaterialPageRoute(builder: (_) => StartScreen()));
  }

  Future<List<Match>> getMatches() async {
    List<Match> matches = [];

    var res = await http.get(
        Uri.parse('http://localhost:8080/match/all'));

    var data = jsonDecode(res.body);

    for (Map m in data) {
      matches.add(Match.fromJsonFull(m));
    }

    return matches;



  }

  void _addMatches() async {

    getMatches().then((matches) {
      for(Match m in matches ) {
          print(m);
        _updateMarker(m);


      }
    });
  }

}


