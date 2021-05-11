import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/Buttons.dart';
import 'package:frontend/Plannedmatches.dart';

class HomeScreen extends StatefulWidget{
  HomeScreen({Key key}) : super(key:key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String text;
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
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
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

      drawerEnableOpenDragGesture: true,
      );



  }
}