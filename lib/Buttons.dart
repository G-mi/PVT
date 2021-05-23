import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Color color;

  const CustomIconButton({Key key, this.onPressed, this.title, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          primary: color,
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          textStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold)),
      child: Row (mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(title, style: TextStyle(fontSize: 20)),
          Icon(Icons.arrow_forward,
            color: Colors.white,
            size: 30.0,),
        ],
      ),
    );

  }


}
