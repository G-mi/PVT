import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/Homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'User.dart';
import 'UserPreferences.dart';

import 'Buttons.dart';

class NewSignUp extends StatefulWidget {

  NewSignUp({Key key}) : super(key: key);


  @override
  _NewSignUpState createState() => _NewSignUpState();
}

class _NewSignUpState extends State<NewSignUp> {
  double _currentSlideValue = 0.0;
  String userInfo;
  int skillLevel;

  @override // lite osäker på vad den här metoden faktiskt gör. Men den får vara här sålänge.
  void initState() {
    super.initState();
  }

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
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            centerTitle: true,
            title: Text('Sign up 2/2'),
            backgroundColor: Colors.green,
          ),
          body: Center(
            child: Stack(
              alignment: Alignment(0.0, -0.95),
              children: [
                FractionallySizedBox(
                  //Bakgrundsruta
                  widthFactor: 0.9,
                  heightFactor: 0.5,
                  child: Container(
                    color: Color.fromRGBO(255, 255, 255, 0.6),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 10, bottom: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                              child: SizedBox(
                            height: 60,
                          )),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 5.0, right: 5.0, top: 5.0, bottom: 0),
                            color: Colors.white,
                            child: (Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                          child: Text(
                                              'Write a few words about yourself. This will be visible to other users on your profile:')),
                                      Divider(color: Colors.black),
                                      Container(
                                        width: 323.2,
                                        height: 120,
                                        color: Colors.white,
                                        child: TextFormField(
                                          keyboardType: TextInputType.multiline,
                                          onChanged: (newValue) =>
                                              setState(() => userInfo = newValue),
                                          maxLines: 5,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Skill level (NPTR) :'),
                              Slider(
                                value: _currentSlideValue,
                                min: 0.0,
                                max: 7.0,
                                divisions: 7,
                                label: _currentSlideValue.round().toString(),
                                onChanged: (double value) {
                                  setState(() {
                                    _currentSlideValue = value;
                                    skillLevel = _currentSlideValue.round();
                                  });
                                },
                                activeColor: Colors.green,
                                inactiveColor: Colors.lightGreen,
                              ),
                            ],
                          ),
                          Text(
                              'Link to info about NPTR (https://www.usta.com/content/dam/usta/pdfs/10013_experience_player_ntrp_guidelines.pdf)      TO BE FIXED '),
                          Expanded(
                              child: SizedBox(
                            height: 0,
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter, // Signupbutton
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 100, bottom: 260),
                      child: CustomIconButton(
                          onPressed: () async {
                            User user = UserPreferences.getUser();
                            user.setInfo(userInfo);
                            user.setSkillLevel(skillLevel);
                            await UserPreferences.setUser(user);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => HomeScreen()));
                          },
                          title: 'Continue',
                          color: Colors.green)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
