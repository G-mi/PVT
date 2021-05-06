import 'package:flutter/material.dart';
import 'signin.dart';

class StartScreen extends StatefulWidget {
  StartScreen({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _StartScreenState createState() => _StartScreenState();
}
//rewrite later
class   _StartScreenState extends State<StartScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

//change to only build if user not signed in when userdata is available, if is go to homepage. Do the check in
  //build method and call on different pages depending on signed in or not.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 300,
                    child: Image.asset('images/logo.png')),
              ),
            ),

            Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 20),
                child: ElevatedButton(
                  onPressed: () {  Navigator.push(
                     context, MaterialPageRoute(builder: (_) => SignIn()));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red,
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
                  ),)
            ),

            Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 20),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: ElevatedButton(
                  onPressed: () {  //Navigator.push(
                    // context, MaterialPageRoute(builder: (_) => SignUp()));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      textStyle: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                  child: Row (mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Sign up  ",style: TextStyle(fontSize: 20)),
                      Icon(Icons.arrow_forward,
                        color: Colors.white,
                        size: 30.0,),
                    ],
                  ),)
            ),
          ],
        ),
      ),
    );
  }
}