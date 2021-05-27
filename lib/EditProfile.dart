import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/UserPreferences.dart';
import 'package:frontend/Widgets/profileWidget.dart';
import 'package:frontend/Widgets/textFieldWidget.dart';
import 'NTRPDialog.dart';
import 'Profile.dart';
import 'User.dart';
import 'Widgets/skillRatingWidget.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  User user;
  @override
  void initState(){
    super.initState();
    user = UserPreferences.getUser();
  }

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
                                  ProfileWidget(),
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
                                    int index = name.indexOf(' ');
                                    user = user.copy(
                                        firstName: name.substring(0, index),
                                        lastName: name.substring(index + 1, name.length));
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
                            height: 165,
                            color: Colors.transparent,
                            child: Column(
                              children: [
                                TextFieldWidget(
                                  label: 'About',
                                  height: 140,
                                  maxLines: 5,
                                  text: user.aboutInfo,
                                  onChanged: (about) {
                                    user = user.copy(aboutInfo: about);
                                  },
                                ),
                              ],
                            ),
                          ),
                          Stack(
                            children: [
                              SkillRatingWidget(
                                skillValue: user.skillLevel,
                                selectedBall: Icon(
                                  Icons.sports_baseball,
                                  color: Colors.deepOrange,
                                  size: 40,),
                                unSelectedBall: Icon(
                                  Icons.sports_baseball_outlined,
                                  color: Color.fromRGBO(255, 87, 34, 0.5),
                                  size: 40,),
                              ),
                              Positioned(
                                top: -13,
                                left: 278,
                                child: IconButton(
                                  icon: Icon(Icons.info),
                                  iconSize: 27,
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) => NTRPDialog()
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 40,
                                height: 40,
                                child: ClipOval(
                                  child: Container(
                                    color: Colors.deepOrange,
                                    child:  IconButton(
                                      icon: Icon(Icons.remove),
                                      iconSize: 25,
                                      color: Colors.white,
                                      onPressed: () {
                                        setState(() {
                                          if (user.skillLevel > 1){
                                            user = user.copy(skillLevel: user.skillLevel - 1);
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 40,),
                              Text(
                                'Choose your skill rating',
                              ),
                              SizedBox(width: 40,),
                              SizedBox(
                                width: 40,
                                height: 40,
                                child: ClipOval(
                                  child: Container(
                                    color: Colors.deepOrange,
                                    child:  IconButton(
                                      icon: Icon(Icons.add),
                                      iconSize: 25,
                                      color: Colors.white,
                                      onPressed: () {
                                        setState(() {
                                          if (user.skillLevel < 7){
                                            user = user.copy(skillLevel: user.skillLevel + 1);
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                ),
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
}
