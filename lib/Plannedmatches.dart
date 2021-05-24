//import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/Buttons.dart';
import 'Homescreen.dart';

class PlannedMatches extends StatefulWidget{
  PlannedMatches({Key key}) : super(key:key);

  @override
  _PlannedMatchesState createState() => _PlannedMatchesState();
}

class _PlannedMatchesState extends State<PlannedMatches> {

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
            leading: IconButton(icon: Icon(Icons.home,),
              onPressed: () {
      Navigator.push( context, MaterialPageRoute(builder: (_) => HomeScreen()));
                   },
            ),
    centerTitle: true,
    title: Text('Planned matches'),
    backgroundColor: Colors.deepOrange,
    ),
    body: Center(
      child: FractionallySizedBox(
        widthFactor: 0.9,
       heightFactor: 0.9,
       child: Container(
         color: Color.fromRGBO(255, 255, 255, 0.5),
          //Todo: add list of matches.

    ),
    ),
    ),
          ),
        ]
    );
  }
}

