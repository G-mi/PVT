import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/Buttons.dart';
import 'package:frontend/startscreen.dart';
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => StartScreen()),
          );
        },
      ),
      backgroundColor: Colors.green,
      centerTitle: true,
      title: Text(
        'Sign up 1/2',
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
          alignment: Alignment(-0.02, -0.1),
          child: Container(
            width: 325,
            height: 500,
            color: Colors.transparent,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.account_circle,
                          size: 80,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        DropdownButton(
                          hint: Text('Gender'),
                          value: _gender,
                          onChanged: (newValue) =>
                              setState(() => _gender = newValue),
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
                        SizedBox(width: 30,),
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
                      children: [
                        SizedBox(width: 15,),
                        Container(
                          width: 130,
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
                        SizedBox(width: 30,),
                        Container(
                          width: 130,
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
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        SizedBox(width: 15,),
                        Container(
                          width: 290,
                          height: 50,
                          color: Colors.white,
                          padding: const EdgeInsets.only(
                              left: 5.0, right: 5.0, top: 0, bottom: 0),
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
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        SizedBox(width: 15,),
                        Container(
                          width: 290,
                          height: 50,
                          color: Colors.white,
                          padding: const EdgeInsets.only(
                              left: 5.0, right: 5.0, top: 0, bottom: 0),
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
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        SizedBox(width: 15,),
                        Container(
                          width: 290,
                          height: 50,
                          color: Colors.white,
                          padding: const EdgeInsets.only(
                              left: 5.0, right: 5.0, top: 0, bottom: 0),
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
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        SizedBox(width: 15,),
                        Container(
                          width: 290,
                          height: 50,
                          color: Colors.white,
                          padding: const EdgeInsets.only(
                              left: 5.0, right: 5.0, top: 0, bottom: 0),
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
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomIconButton(
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {

                              Navigator.push(context, MaterialPageRoute(
                                  builder: (_) => NewSignUp(firstName, lastName, email, userName, password, _gender, age)));
                            }
                          },
                          title: 'Continue',
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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