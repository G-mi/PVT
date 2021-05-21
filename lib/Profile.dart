import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'Homescreen.dart';

class Profile extends StatefulWidget{
  Profile({Key key}) : super(key:key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile>{

  @override
  Widget build(BuildContext context){
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.jpg'),
              fit: BoxFit.cover,
            )
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: buildAppBar(context),
          body: Center(
            child: FractionallySizedBox(
              widthFactor: 0.9,
              heightFactor: 0.9,
              child: Container(
                color: Color.fromRGBO(255, 255, 255, 0.5),
              )
            )
          )
        ),
      ],
    );
  }
}

AppBar buildAppBar(BuildContext context){
  return AppBar(
    leading: IconButton(
      icon: Icon(Icons.home),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
      },
    ),
    backgroundColor: Colors.deepOrange,
    centerTitle: true,
    title: const Text('Username'),
  );
}