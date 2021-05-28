import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/Buttons.dart';
import 'NewSignUp.dart';
import 'UserPreferences.dart';
import 'User.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  //get username => null;

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _gender;
  String firstName;
  String lastName;
  String userName;
  String email;
  String firstPassword;
  String password;
  int age;
  User user;
  final _formKey = GlobalKey<FormState>();

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
            title: Text('Sign up 1/2'),
            backgroundColor: Colors.green,
          ),
          body: Center(
            child: Stack(
              alignment: Alignment(0.0, -0.95),
              children: [
                FractionallySizedBox(
                  widthFactor: 0.9,
                  heightFactor: 0.5,
                  child: Container(
                    color: Color.fromRGBO(255, 255, 255, 0.6),
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 0, bottom: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                DropdownButton(
                                  hint: Text('Gender'),
                                  value: _gender,
                                  //_gender
                                  onChanged: (newValue) =>
                                      setState(() => _gender = newValue),
                                  // onChanged: (newValue) => setState(() => user = user.copy(gender: newValue)), //fields are final in user, this applies value. new copy becomes user
                                  items: <String>[
                                    'Male',
                                    'Female',
                                  ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                ),
                                Text('Age:     '),
                                Container(
                                  width: 35,
                                  height: 30,
                                  padding: const EdgeInsets.only(
                                      left: 5.0, right: 5.0, top: 0, bottom: 0),
                                  color: Colors.white,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    onChanged: (newValue) =>
                                        setState(() =>
                                        age = int.parse(newValue)),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 150,
                                  height: 50,
                                  padding: const EdgeInsets.only(
                                      left: 5.0, right: 5.0, top: 0, bottom: 0),
                                  color: Colors.white,
                                  child: TextFormField(
                                    validator: (val) =>
                                    val.isEmpty
                                        ? 'Enter your first name'
                                        : null,
                                    decoration: InputDecoration(
                                        labelText: ' First name '),
                                    onChanged: (newValue) =>
                                        setState(() => firstName = newValue),
                                  ),
                                ),
                                Expanded(
                                    child: SizedBox(
                                      height: 40,
                                    )),
                                Container(
                                  width: 150,
                                  height: 50,
                                  padding: const EdgeInsets.only(
                                      left: 5.0, right: 5.0, top: 0, bottom: 0),
                                  color: Colors.white,
                                  child: TextFormField(
                                    validator: (val) =>
                                    val.isEmpty
                                        ? 'Enter your last name'
                                        : null,
                                    onChanged: (newValue) =>
                                        setState(() => lastName = newValue),
                                    decoration: const InputDecoration(
                                        labelText: ' Last name '),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                                child: SizedBox(
                                  height: 40,
                                )),
                            Container(
                              color: Colors.white,
                              padding: const EdgeInsets.only(
                                  left: 5.0, right: 5.0, top: 0, bottom: 0),
                              height: 50,
                              child: TextFormField(
                                onChanged: (newValue) =>
                                    setState(() => userName = newValue),
                                validator: (val) =>
                                val.isEmpty
                                    ? 'Enter a user name'
                                    : null,
                                decoration: const InputDecoration(
                                    labelText: ' User Name '),
                              ),
                            ),
                            Expanded(
                                child: SizedBox(
                                  height: 40,
                                )),
                            Container(
                              color: Colors.white,
                              padding: const EdgeInsets.only(
                                  left: 5.0, right: 5.0, top: 0, bottom: 0),
                              height: 50,
                              child: TextFormField(
                                validator: (val) =>
                                val.isEmpty
                                    ? 'Enter your email adress'
                                    : null,
                                onChanged: (newValue) =>
                                    setState(() => email = newValue),
                                decoration:
                                const InputDecoration(labelText: ' Email '),
                              ),
                            ),
                            Expanded(
                                child: SizedBox(
                                  height: 40,
                                )),
                            Container(
                              color: Colors.white,
                              padding: const EdgeInsets.only(
                                  left: 5.0, right: 5.0, top: 0, bottom: 0),
                              height: 50,
                              child: TextFormField(
                                validator: (val) =>
                                val.isEmpty
                                    ? 'Enter a password'
                                    : null,
                                onChanged: (newValue) =>
                                    setState(() => firstPassword = newValue),
                                decoration: const InputDecoration(
                                    labelText: ' Password'),
                                obscureText: true,
                                obscuringCharacter: "*",
                              ),
                            ),
                            Expanded(
                                child: SizedBox(
                                  height: 40,
                                )),
                            Container(
                              color: Colors.white,
                              padding: const EdgeInsets.only(
                                  left: 5.0, right: 5.0, top: 0, bottom: 0),
                              height: 50,
                              child: TextFormField(
                                validator: (val) =>
                                val.isEmpty
                                    ? 'Enter a password'
                                    : null,
                                onChanged: (newValue) =>
                                firstPassword == newValue ? setState(() =>
                                password = newValue) : 'not a match',
                                // generate an error?
                                //TODO: onChanged: set password. and validate same password
                                decoration: const InputDecoration(
                                    labelText: ' Confirm password '),
                                obscureText: true,
                                obscuringCharacter: "*",
                              ),
                            ),
                            Expanded(
                                child: SizedBox(
                                  height: 0,
                                )),
                          ],
                        ),
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
                            if (_formKey.currentState.validate()) {

                              Navigator.push(context, MaterialPageRoute(
                                  builder: (_) => NewSignUp(firstName, lastName, email, userName, password, _gender, age)));
                            }
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

  void _openSecondSignUp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => SignUp()),
    );
  }
}