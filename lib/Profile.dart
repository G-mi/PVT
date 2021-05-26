import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/EditProfile.dart';
import 'package:frontend/Homescreen.dart';
import 'package:frontend/UserPreferences.dart';
import 'package:frontend/Widgets/profileWidget.dart';
import 'package:frontend/Widgets/skillRatingWidget.dart';

class Profile extends StatefulWidget{
  Profile({Key key}) : super(key:key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final user = UserPreferences.getUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  Widget buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.home),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => HomeScreen())
          );
        },
      ),
      backgroundColor: Colors.deepOrange,
      centerTitle: true,
      title: Text(
        user.userName,
      ),
    );
  }

  Widget buildBody() {
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
        Center (
          child: FractionallySizedBox(
            widthFactor: 0.9,
            heightFactor: 0.9,
            child: Container(
              color: Color.fromRGBO(255, 255, 255, 0.5),
            ),
          ),
        ),
        Stack(
          children: [
            Align(
              alignment: Alignment(0.87, -0.88),
              child: ClipOval(
                child: Material(
                  color: Colors.deepOrange,
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: IconButton(
                      icon: Icon(Icons.edit),
                      color: Colors.white,
                      onPressed: () async {
                        print(user.getFullName());
                        await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => EditProfile()));
                        setState(() {
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.0, -0.8),
              child: ProfileWidget(
                imagePath: user.imagePath,
              ),
            ),
            Align(
              alignment: Alignment(0.0, -0.30),
              child: SizedBox(
                width: 200,
                height: 75,
                child: buildUserinfo(),
              ),
            ),
            Align(
              alignment: Alignment(-0.7, -0.05),
              child: SizedBox(
                width: 93,
                height: 16,
                child: Text(
                  user.email,
                  style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.normal, fontSize: 12),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.0, 0.28),
              child: buildAboutInfo(),
            ),
            Align(
              alignment: Alignment(0.35, 0.65),
              child: buildSkillRating(),
            ),
            Positioned(
              top: 460,
              left: 54,
              child: Row(
                children: [
                  Text(
                    'Beginner',
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
                  ),
                  SizedBox(width: 145,),
                  Text(
                    'Advanced',
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildSkillRating() {
    return SizedBox(
      width: 280,
      height: 80,
      child: Container(
        color: Colors.transparent,
        child: IconTheme(
          data: IconThemeData(
            color: Colors.deepOrange,
            size: 50,
          ),
          child: SkillRatingWidget(
            skillValue: user.skillLevel,
            selectedBall: Icon(Icons.sports_baseball, color: Colors.deepOrange, size: 50,),
            unSelectedBall: Icon(Icons.sports_baseball_outlined, color: Color.fromRGBO(255, 87, 34, 0.5), size: 50,),
          ),
        ),
      ),
    );
  }

  Widget buildUserinfo() {
    return Column(
      children: [
        Text(
          user.getFullName(),
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 26),
        ),
        Text(
          user.userName,
          style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.normal, fontSize: 20),
        ),
        Text(
          '${user.age}',
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
        ),
      ],
    );
  }

  Widget buildAboutInfo() {
    return SizedBox(
      width: 280,
      height: 120,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: 13,
            vertical: 8
        ),
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 20),
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(13.0),
        ),
        child: Text(
          user.aboutInfo,
        ),
      ),
    );
  }
}