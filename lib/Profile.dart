import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:frontend/Widgets/profileWidget.dart';
import 'Homescreen.dart';

class Profile extends StatefulWidget{
  Profile({Key key}) : super(key:key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _showFullName = true;
  bool _showEmail = false;
  bool _showAge = true;


  @override
  Widget build(BuildContext context) {
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
                child: Stack(
                  children: [
                    FractionallySizedBox(
                      widthFactor: 0.9,
                      heightFactor: 0.9,
                      child: Container(
                        color: Color.fromRGBO(255, 255, 255, 0.5),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 20,
                              left: 95,
                              child: buildCircle(
                                color: Colors.deepOrange,
                                all: 3,
                                child: ProfileWidget(
                                  imagePath: 'https://icon-library.com/images/doge-icon/doge-icon-28.jpg',
                                  // user.imagePath
                                ),
                              ),
                            ),
                            Positioned(
                              top: 5,
                              left: 265,
                              child: buildEditButton(),
                            ),
                            Positioned(
                              top: 155,
                              left: 107,
                              child: buildName(),)
                          ],
                        ),
                      ),
                    ),
                  ],
                )
            )
        ),
      ],
    );
  }


  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.home),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => HomeScreen()));
        },
      ),
      backgroundColor: Colors.deepOrange,
      centerTitle: true,
      title: const Text('Username'), // user.userName
    );
  }

  Widget buildEditButton() =>
      buildCircle(
        color: Colors.deepOrange,
        all: 1,
        child: IconButton(
          icon: Icon(Icons.edit),
          color: Colors.white,
          iconSize: 35,
          onPressed: () {},
        ),
      );

  Widget buildCircle({
    Widget child,
    double all,
    Color color,
  }) =>
      ClipOval(
          child: Container(
            padding: EdgeInsets.all(all),
            color: color,
            child: child,
          )
      );


  Widget buildName() =>
      Column(
        children: [
          if (_showFullName) ...[
            Text(
              'Full Name', //user.fullName
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 26),
            ),
          ],
          Text(
            'UserName', //user.userName
            style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.normal, fontSize: 20),
          ),
          if (_showAge) ...[
            Text(
              '34', //user.age
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17),
            ),
          ],
        ],
      );
}