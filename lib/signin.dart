import 'package:flutter/material.dart';
import 'package:frontend/Buttons.dart';
import 'package:frontend/signup.dart';

class SignIn extends StatelessWidget {


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
      appBar: AppBar(centerTitle: true,
        title: Text('Sign in'),
        backgroundColor: Colors.deepOrange,
        actions: <Widget>
      [IconButton(icon: Icon(Icons.arrow_back,
          color: Colors.white,),
            onPressed: () {
           Navigator.pop(context);
            }
            )
        ],
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
              Container(
                  width: 400,
                  height:70,
                  color: Colors.transparent,
              child: SignInButton( onPressed: () {  Navigator.push(
    context, MaterialPageRoute(builder: (_) => SignUp()));
    },
    ),

              )
            ]
        )
      )
    )
    ]
    );


  }
}
