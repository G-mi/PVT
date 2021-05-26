import 'package:flutter/material.dart';
import 'package:frontend/Buttons.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _gender;
  double _currentSlideValue = 16;

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
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              DropdownButton(
                                hint: Text('Gender'),
                                value: _gender,
                                onChanged: (newValue) {
                                  setState(() {
                                    _gender = newValue;
                                  });
                                },
                                items: <String>[
                                  'Male',
                                  'Female',
                                  'Other',
                                ].map<DropdownMenuItem<String>>((String value) {
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 400,
                                height: 40,
                                color: Colors.white,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: ' First name '),
                                ),
                              ),
                              Expanded(
                                  child: SizedBox(
                                height: 50,
                              )),
                              Container(
                                width: 400,
                                height: 40,
                                color: Colors.white,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: ' Last name '),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                              child: SizedBox(
                            height: 50,
                          )),
                          Container(
                            color: Colors.white,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  labelText: ' User Name '),
                            ),
                          ),
                          Expanded(
                              child: SizedBox(
                            height: 50,
                          )),
                          Container(
                            color: Colors.white,
                            child: TextFormField(
                              decoration:
                                  const InputDecoration(labelText: ' Email '),
                            ),
                          ),
                          Expanded(
                              child: SizedBox(
                            height: 50,
                          )),
                          Container(
                            color: Colors.white,
                            child: TextFormField(
                              decoration:
                                  const InputDecoration(labelText: ' Password'),
                            ),
                          ),
                          Expanded(
                              child: SizedBox(
                            height: 50,
                          )),
                          Container(
                            color: Colors.white,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  labelText: ' Confirm password '),
                            ),
                          ),
                          Expanded(
                              child: SizedBox(
                            height: 50,
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15, bottom: 20),
                      child: CustomIconButton(
                        onPressed: _handleSignUp,
                        title: 'Continue',
                      )),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _handleSignUp() async {}
}
