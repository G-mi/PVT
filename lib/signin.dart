import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(centerTitle: true,
        title: Text('Sign in'),
        actions: <Widget>
      [IconButton(icon: Icon(Icons.arrow_back,
          color: Colors.white,),
            onPressed: () {
           Navigator.pop(context);
            }
            )
        ],
      ),
    );

    // TODO: implement build
    throw UnimplementedError();
  }
}
