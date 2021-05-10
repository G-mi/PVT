import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/signin.dart';

class SignInButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SignInButton({Key key, this.onPressed}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,


      style: ElevatedButton.styleFrom(
          primary: Colors.deepOrange,
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          textStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold)),
      child: Row (mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Sign in  ",style: TextStyle(fontSize: 20)),
          Icon(Icons.arrow_forward,
            color: Colors.white,
            size: 30.0,),
        ],
      ),
    );

  }


}