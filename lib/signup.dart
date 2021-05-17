import 'package:flutter/material.dart';

class SignUp extends StatefulWidget{
  SignUp ({Key key}) : super(key:key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _gender;
 double _currentSlideValue =  16;

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
              centerTitle: true,
              title: Text('Sign up'),
              backgroundColor: Colors.green,
            ),
            body: Center(
              child: Stack(
                children: [
                  FractionallySizedBox(
                    widthFactor: 0.9,
                    heightFactor: 0.7,
                    child: Container(
                      color: Color.fromRGBO(255, 255, 255, 0.5),
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row( mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                DropdownButton(
                                  hint: Text('Gender'),
                                  value: _gender,
                                  onChanged: ( newValue) {
                                    setState(() {
                                      _gender= newValue;
                                    });
                                  },
                                  items: <String>['Male', 'Female', 'Other',]
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                                Text('Age:     '),
                                Slider(
                                  value: _currentSlideValue,
                                  min: 16.0,
                                  max: 100.0,
                                  divisions: 100,
                                  label: _currentSlideValue.round().toString(),
                                  onChanged: (double value) {
                                    setState(() {
                                      _currentSlideValue = value;
                                    });
                                  },
                                ),
                              ],
                            ),

                            Row( mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 100,
                                  height:40,
                                  color: Colors.white,
                                  child: TextFormField(
                                    decoration: const InputDecoration(labelText: ' First name '),
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  height:40,
                                  color: Colors.white,
                                  child: TextFormField(
                                    decoration: const InputDecoration(labelText: ' Last name '),
                                  ),
                                ),
                              ],
                            ),
                            Expanded( child: SizedBox(height: 50,)),
                            Container(
                              width: 400,
                              height:70,
                              color: Colors.white,
                              child: TextFormField(
                                decoration: const InputDecoration(labelText: ' User Name '),
                              ),
                            ),
                            Expanded( child: SizedBox(height: 50,)),

                            Container(
                              width: 400,
                              height:70,
                              color: Colors.white,
                              child: TextFormField(
                                decoration: const InputDecoration(labelText: ' Email '),
                              ),
                            ),
                            Expanded( child: SizedBox(height: 50,)),

                            Container(
                              width: 400,
                              height:70,
                              color: Colors.white,
                              child: TextFormField(
                                decoration: const InputDecoration(labelText: ' Password'),
                              ),
                            ),
                            Expanded( child: SizedBox(height: 50,)),
                            Container(
                              width: 400,
                              height:70,
                              color: Colors.white,
                              child: TextFormField(
                                decoration: const InputDecoration(labelText: ' Confirm password '),
                              ),
                            ),
                            Expanded( child: SizedBox(height: 50,)),
                          ],
                        ),

                    ),
                  ),

              ],

    ),
          ),
          ),
              ],
            );

  }
}

