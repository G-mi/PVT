import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/UserPreferences.dart';
import 'package:frontend/Widgets/profileWidget.dart';
import 'package:frontend/Widgets/textFieldWidget.dart';

import 'Profile.dart';
import 'Widgets/skillRatingWidget.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildEditAppBar(),
      body: buildBody(),
    );
  }

  Widget buildEditAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => Profile())
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
        Center(
          child: FractionallySizedBox(
            widthFactor: 0.9,
            heightFactor: 0.9,
            child: Container(
              color: Color.fromRGBO(255, 255, 255, 0.5),
            ),
          ),
        ),
        Center(
          child: Container(
            height: 500,
            width: 325,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 325,
                            height: 118,
                            color: Colors.transparent,
                            child: Container(
                              alignment: Alignment.topCenter,
                              child: Stack(
                                children: [
                                  ProfileWidget(
                                    imagePath: user.imagePath,
                                  ),
                                  Positioned(
                                    top: 80,
                                    left: 90,
                                    child: buildPicIcon(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            width: 325,
                            height: 100,
                            color: Colors.transparent,
                            child: Column(
                              children: [
                                TextFieldWidget(
                                  label: 'Full Name',
                                  text: user.getFullName(),
                                  onChanged: (name) {
                                    var split = name.split(' ');
                                    print(split[2]);
                                    user = user.copy();
                                  },
                                ),
                                TextFieldWidget(
                                  label: 'Email',
                                  text: user.email,
                                  onChanged: (email) {
                                    user = user.copy(email: email);
                                  },
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 325,
                            height: 66,
                            color: Colors.transparent,
                            child: Column(
                              children: [
                                Text(
                                    'Allow user to see:'
                                ),
                                Container(
                                  width: 300,
                                  height: 25,
                                  child: Row(
                                    children: [
                                      SizedBox(width: 20,),
                                      Checkbox(
                                        value: user.showFullName,
                                        onChanged: (value) {
                                          setState(() {
                                            user = user.copy(showFullName: value);
                                          });
                                        },
                                        activeColor: Colors.deepOrange,
                                      ),
                                      Text('Full Name'),
                                      SizedBox(width: 40,),
                                      Checkbox(
                                        value: user.showAge,
                                        onChanged: (value) {
                                          setState(() {
                                            user = user.copy(showAge: value);
                                          });
                                        },
                                        activeColor: Colors.deepOrange,
                                      ),
                                      Text('Age'),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 300,
                                  height: 25,
                                  child: Row(
                                    children: [
                                      SizedBox(width: 20,),
                                      Checkbox(
                                        value: user.showEmail,
                                        onChanged: (value) {
                                          setState(() {
                                            user = user.copy(showEmail: value);
                                          });
                                        },
                                        activeColor: Colors.deepOrange,
                                      ),
                                      Text('Email'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 325,
                            height: 140,
                            color: Colors.transparent,
                            child: Column(
                              children: [
                                TextFieldWidget(
                                  label: 'About',
                                  height: 122,
                                  maxLines: 5,
                                  text: user.aboutInfo,
                                  onChanged: (about) {
                                    user = user.copy(aboutInfo: about);
                                  },
                                ),
                              ],
                            ),
                          ),
                          SkillRatingWidget(
                            skillValue: user.skillLevel,
                            selectedBall: Icon(
                              Icons.sports_baseball,
                              color: Colors.deepOrange,
                              size: 50,),
                            unSelectedBall: Icon(
                              Icons.sports_baseball_outlined,
                              color: Color.fromRGBO(255, 87, 34, 0.5),
                              size: 50,),
                          ),
                          Row(
                            children: [
                              SizedBox(width: 37,),
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
                        ],
                      ),
                      Container(
                        width: 325,
                        height: 40,
                        color: Colors.transparent,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: ClipOval(
                            child: Material(
                              color: Colors.deepOrange,
                              child: SizedBox(
                                width: 40,
                                height: 40,
                                child: IconButton(
                                  icon: Icon(Icons.check),
                                  color: Colors.white,
                                  onPressed: () {
                                    UserPreferences.setUser(user);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (_) => Profile()));
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
  
  Widget buildPicIcon() {
    return ClipOval(
      child: Container(
        padding: EdgeInsets.all(8),
        color: Colors.deepOrange,
        child: Icon(
          Icons.camera_alt,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
