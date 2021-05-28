import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/Homescreen.dart';
import 'package:frontend/UserPreferences.dart';
import 'package:frontend/startscreen.dart';

class Loading extends StatefulWidget {



  Loading  ({Key key}) : super(key:key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading > {
  String _token = "";
  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  _loadUser() async {
    WidgetsFlutterBinding.ensureInitialized();
    await UserPreferences.init();
    UserPreferences.setAccessToken();

    _token = UserPreferences.getAccessToken() ?? "";

    if (_token == "") {
        Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => StartScreen(),
            ));
      } else
      Navigator.push(context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));

    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }


  }

