import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

class LocationPicker extends StatefulWidget {
  LocationPicker({Key key}) : super(key: key);
  @override
  _LocationPickerState createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  Completer<GoogleMapController> _controller = Completer();
  static const  LatLng _center = const LatLng(59.334591, 18.063240);
  GoogleMapsPlaces _tennisCourts = GoogleMapsPlaces(apiKey: "AIzaSyBx8eSPRpBYjI2jL5BJNdgFupMUf5cae_Y");
  Set<Marker> _markers = <Marker>{};
  List<PlacesSearchResult> places = [];
  LatLng pickedLocation;

  _onMapCreated(GoogleMapController controller){
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          mapToolbarEnabled: false,
          initialCameraPosition: CameraPosition(target: _center, zoom: 12.0),
          onMapCreated: _onMapCreated,
          markers: Set<Marker>.of(_markers),
          onTap: _handleTap,
        ),
        Align(
          alignment: Alignment(0.0, 0.9),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context, pickedLocation);
            },
            child: Text('Confirm'),
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
            ),
          ),
        ),
        Align(
          alignment: Alignment(-0.9, 0.9),
          child: SizedBox(
            width: 40,
            height: 40,
            child: ClipOval(
              child: Material(
                child: Container(
                  color: Colors.green,
                  child: IconButton(
                    onPressed: () {
                      searchTennisCourts(_center);
                    },
                    icon: Icon(Icons.search),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _handleTap(LatLng location){
    setState(() {
      searchTennisCourts(_center);
      _markers.add(
          Marker(
            markerId: MarkerId(location.toString()),
            position: location,
            icon: BitmapDescriptor.defaultMarkerWithHue(120.0),
          )
      );
      setState(() {
        pickedLocation = location;
      });
    });
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
          infoWindow: InfoWindow(
              title: f.name,
              snippet: f.vicinity,
          ),
          position: LatLng(f.geometry.location.lat, f.geometry.location.lng),
          onTap: (){
            _handleTap(LatLng(f.geometry.location.lat, f.geometry.location.lng));
          }
        );
        _markers.add(marker);
      });
    });
  }}