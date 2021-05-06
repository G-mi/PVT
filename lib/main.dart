import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
  /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
  child: Image.asset('images/logo.png')),
  ),
  ),

  Padding(
  padding: const EdgeInsets.only(
  left: 15.0, right: 15.0, top: 15, bottom: 20),
      child: ElevatedButton(
        onPressed: () {  //Navigator.push(
          // context, MaterialPageRoute(builder: (_) => SignUp()));
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
              color: Colors.black,
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
            Text("Sign up    ",style: TextStyle(fontSize: 20)),
            Icon(Icons.arrow_forward,
              color: Colors.black,
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





