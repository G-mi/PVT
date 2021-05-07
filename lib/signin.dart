import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
      appBar: AppBar(centerTitle: true,
        title: Text('Sign in'),
        backgroundColor: Colors.red,
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
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
              ),

      ])
      )
    );


  }
}
