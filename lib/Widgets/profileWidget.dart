


import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String imagePath;

  const ProfileWidget({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: buildImage(),
    );
  }

  Widget buildImage(){
    if (imagePath.isEmpty){
      return ClipOval(
        child: Material(
          color: Colors.transparent,
          child: Icon(
            Icons.account_circle,
            color: Colors.white,
            size: 128,
          ),
        ),
      );
    }else{
      final image = NetworkImage(imagePath);
      return ClipOval(
        child: Material(
          color: Colors.transparent,
          child: Ink.image(
            image: image,
            fit: BoxFit.cover,
            width: 128,
            height: 128,
          ),
        ),
      );
    }
  }
}