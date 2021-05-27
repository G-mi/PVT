import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {

  ProfileWidget({Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildImage(),
      ],
    );
  }

  Widget buildImage() {
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Icon(
          Icons.account_circle,
          color: Colors.black,
          size: 128,
        ),
      ),
    );
  }
}