import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/Homescreen.dart';
import 'package:frontend/Widgets/skillRatingWidget.dart';
import 'NTRPDialog.dart';
import 'User.dart';
import 'UserPreferences.dart';
import 'package:http/http.dart' as http;
import 'Buttons.dart';
import 'dart:convert';

class NewSignUp extends StatefulWidget {
  final int age;
  final String firstName;
  final String gender;
  final String email;
  final String lastName;
  final String userName;
  final String password;

  NewSignUp(this.firstName, this.lastName,this.email, this.userName, this.password, this.gender, this.age, {Key key}) : super(key: key);


  @override
  _NewSignUpState createState() => _NewSignUpState();
}

class _NewSignUpState extends State<NewSignUp> {
  String userInfo;
  int skillLevel = 2;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: Colors.green,
      centerTitle: true,
      title: Text(
        'Sign up 2/2',
      ),
    );
  }

  Widget _buildBody() {
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
        Align(
          alignment: Alignment.center,
          child: Container(
            child: FractionallySizedBox(
              widthFactor: 0.9,
              heightFactor: 0.9,
              child: Container(
                color: Color.fromRGBO(255, 255, 255, 0.5),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment(-0.02, -0.2),
          child: Container(
            width: 325,
            height: 500,
            color: Colors.transparent,
            child: SingleChildScrollView (
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_circle,
                        size: 100,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hi! ${widget.firstName} ${widget.lastName}',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 250,
                        height: 50,
                        child: Text(
                          'Write a few words about yourself. This will be visible to other users on your profile:',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 300,
                        height: 130,
                        color: Colors.transparent,
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onChanged: (newValue) =>
                              setState(() =>
                              userInfo = newValue),
                          maxLines: 5,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  SkillRatingWidget(
                    skillValue: skillLevel,
                    selectedBall: Icon(
                      Icons.sports_baseball,
                      color: Colors.green,
                      size: 40,
                    ),
                    unSelectedBall: Icon(
                      Icons.sports_baseball_outlined,
                      color: Color.fromRGBO(76, 175, 80, 0.5),
                      size: 40,
                    ),
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
                            color: Colors.green,
                            child:  IconButton(
                              icon: Icon(Icons.remove),
                              iconSize: 25,
                              color: Colors.white,
                              onPressed: () {
                                setState(() {
                                  if (skillLevel > 1){
                                    skillLevel = skillLevel - 1;
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
                            color: Colors.green,
                            child:  IconButton(
                              icon: Icon(Icons.add),
                              iconSize: 25,
                              color: Colors.white,
                              onPressed: () {
                                setState(() {
                                  if (skillLevel < 7) {
                                    skillLevel = skillLevel + 1;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () =>
                            _handleSignUp(
                                widget.firstName,
                                widget.lastName,
                                widget.email,
                                widget.userName,
                                widget.password,
                                widget.age,
                                widget.gender,
                                skillLevel,
                                userInfo
                            ),
                        child: Row(
                          children: [
                            Text(
                                'Continue'
                            ),
                            SizedBox(width: 40,),
                            Icon(
                              Icons.arrow_forward,
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          textStyle: TextStyle(fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 360,
          left: 290,
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
    );
  }

  void _handleSignUp(String firstName, String lastName, String email, String userName, String password, int age,
      String gender, int skillLevel, String userInfo) async {


    var res = await http.post(
        Uri.parse("http://localhost:8080/user/signup"), body:
    {
      'username': userName,
      'password': password,
      'email': email,
      'firstname': firstName,
      'lastname': lastName,
      'age': age.toString(),
      'gender': gender,
      'skillLevel': skillLevel.toString(),
      'aboutInfo': userInfo
    });




   /*

    final String _baseUrl = "group4-75.pvt.dsv.su.se";
    var uri = Uri.https(_baseUrl,'/user/signup');
    print(uri.toString());
    var res = await http.post(Uri.parse('https://group4-75.pvt.dsv.su.se/user/signup'), body: {
      'username': userName,
      'password': password,
      'email': email,
      'firstname': firstName,
      'lastname': lastName,
      'age': age.toString(),
      'gender': gender,
      'skillLevel': skillLevel.toString(),
      'aboutInfo': userInfo
    });
    */

    if (res.statusCode == 200) {

      User user = User.signUp(
          firstName,
          lastName,
          userName,
          email,
          userInfo,
          age,
          skillLevel);

      //get a accesstoken and sign the user in

      var res = await http.post(
          Uri.parse("http://localhost:8080/user/signin"), body:
      {'username': userName, 'password': password});


        Map data = json.decode(res.body) as Map;
        UserPreferences.setAccessToken(data['accessToken']);
        await UserPreferences.setUser(user);



      Navigator.push(context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));

      //todo:: error message
    }
  }
}



