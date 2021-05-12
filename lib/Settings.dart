import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Homescreen.dart';

class Settings extends StatefulWidget{
  Settings ({Key key}) : super(key:key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {


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
                title: Text('Settings'),
                backgroundColor: Colors.deepOrange,
              ),
              body: Center(

                  child: Stack(
                    children: [

                    FractionallySizedBox(
                        widthFactor: 0.9,
                        heightFactor: 0.3,
                        child: Container(
                            color: Color.fromRGBO(0, 255, 0, 0.5),
                            //Todo: add list of matches.

                        ),
                    ),

                 FractionallySizedBox(
                      widthFactor: 0.9,
                      heightFactor: 0.9,
                      child: Container(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          //Todo: add list of matches.

                      ),
                  ),
              ],
          ),
          ),
          ),
        ]
    );
  }
}
