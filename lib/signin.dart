import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frontend/Buttons.dart';
import 'package:frontend/Homescreen.dart';
import 'package:frontend/User.dart';
import 'package:frontend/signup.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {

  SignIn ({Key key}) : super(key:key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    String text;
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
              appBar: AppBar(centerTitle: true,
                title: Text('Sign in'),
                backgroundColor: Colors.deepOrange,
              ),
              body: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 60.0),
                          child: Center(
                            child: Container(
                                width: 100,
                                height: 200,
                                child: Image.asset('images/tennisball.png')),

                          ),
                        ), Padding(
                          padding: EdgeInsets.only(bottom: 40.0),
                          child: Container(
                            width: 400,
                            height: 70,
                            color: Colors.white,
                            child: TextFormField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                  labelText: ' Username/E-mail'),

                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 40.0),
                          child: Container(
                            width: 400,
                            height: 70,
                            color: Colors.white,
                            child: TextFormField(
                              controller: passwordController,
                              decoration: const InputDecoration(
                                  labelText: ' Password'),
                            ),
                          ),
                        ),
                        Container( //Sign in button
                          width: 400,
                          height: 70,
                          color: Colors.transparent,
                          child: CustomIconButton(
                            onPressed: () => signin(emailController.text, passwordController.text) ,
                            title: text = 'Sign in',
                            color: Colors.deepOrange,
                          ),
                        ),
                        Container( //Continue with google button
                          width: 400,
                          height: 70,
                          color: Colors.transparent,
                          child: CustomIconButton(onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => SignUp()));
                          },
                            title: text = 'Continue with Google',
                            color: Colors.green,
                          ),

                        ),
                        TextButton //No account dialog?
                          (onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => SignUp()));
                        }, style: TextButton.styleFrom(
                          primary: Colors.black,
                        ),
                          child: Text('Dont have an account? Sign up'),
                        ),
                        TextButton //reset password
                          (onPressed: () {
                          Navigator.push(
                              context, MaterialPageRoute(
                              builder: (_) => ResetPassword()));
                        }, style: TextButton.styleFrom(
                          primary: Colors.black,
                        ),
                          child: Text('forgot password?'),
                        )
                      ]
                  )
              )
          )
        ]
    );
  }


  signin(String email, password) async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

       var res = await http.post(
        Uri.parse("http://localhost:8080/user/signin"), body:
        {'username': email, 'password': password});

    if (res.statusCode == 200) {
      Map data = json.decode(res.body) as Map;

      sharedPreferences.setString('username', data['username']);
      sharedPreferences.setString("token", data['accessToken']);
      //todo: save in safe storage.
      getUserdata(email);
          }

    else displayDialog(context, "Something went wrong",
        "No account was found matching that username and password");
  }

  getUserdata(String email) async{

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    //get data for current user
    //change url later
    var userdata = await http.get(
        Uri.http("localhost:8080","/user/currentuserinfo",
            {"name": email }));

    var data = json.decode(userdata.body);
    User user = User.fromJsonFull(data);

    sharedPreferences.setString('email', user.email);
    sharedPreferences.setString('firstname', user.firstName);
    sharedPreferences.setString('lastname', user.lastName);
    sharedPreferences.setString('age', user.age.toString());
    sharedPreferences.setString('Skillevel', user.skillLevel.toString());

    Navigator.push(context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ));
  }


  void displayDialog(context, title, text) => showDialog(
    context: context,
    builder: (context) =>
        AlertDialog(title: Text(title), content: Text(text)),
  );
}

//Todo:: Implement. Verify email, send mail
class ResetPassword extends StatefulWidget {
  ResetPassword({Key key}) : super(key:key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Reset password?'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Please enter your e-mail address.'),
            TextFormField(),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Send'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}


