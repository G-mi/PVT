import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String imagePath;

  ProfileWidget({Key key, @required this.imagePath,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildImage(),
      ],
    );
  }

  Widget buildImage() {
    if (imagePath == null || imagePath.length == 0 ){
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
    }else{
      final image = NetworkImage(imagePath);
      return ClipOval(
        child: Material(
          color: Colors.transparent,
          child: Ink.image(
            image: image,
            fit: BoxFit.cover,
            width: 115,
            height: 115,
          ),
        ),
      );
    }
  }
}