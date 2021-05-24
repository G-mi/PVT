import 'package:flutter/material.dart';
import 'package:frontend/Buttons.dart';
import 'package:frontend/Homescreen.dart';
import 'package:frontend/signup.dart';

class SignIn extends StatelessWidget {


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
                height:70,
                color: Colors.white,
               child: TextFormField(
                decoration: const InputDecoration(labelText: ' Username/E-mail'),
              ),
                ),
              ),
                Padding(
                padding: EdgeInsets.only(bottom: 40.0),
              child: Container(
                width: 400,
                height:70,
                color: Colors.white,
                child: TextFormField(
                  decoration: const InputDecoration(labelText: ' Password'),
                ),
              ),
                ),
              Container( //Sign in button
                  width: 400,
                  height:70,
                  color: Colors.transparent,
              child: CustomIconButton( onPressed: () {  Navigator.push(
    context, MaterialPageRoute(builder: (_) => HomeScreen()));
    },
        title: text = 'Sign in',
        color: Colors.deepOrange,
    ),
              ),
              Container( //Continue with google button
                width: 400,
                height:70,
                color: Colors.transparent,
                child: CustomIconButton( onPressed: () {  Navigator.push(
                    context, MaterialPageRoute(builder: (_) => SignUp()));
                },
                  title: text = 'Continue with Google',
                  color: Colors.green,
                ),

              ),
              TextButton //No account dialog?
                (onPressed:  () {  Navigator.push(
    context, MaterialPageRoute(builder: (_) => SignUp()));
    },   style: TextButton.styleFrom(
                primary: Colors.black,
              ),
                child: Text('Dont have an account? Sign up'),
              ),
              TextButton //reset password
                (onPressed:  () {  Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ResetPassword()));
              },   style: TextButton.styleFrom(
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


