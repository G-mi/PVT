import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SkillRatingWidget extends StatelessWidget {
  final int skillValue;
  final Widget selectedBall;
  final Widget unSelectedBall;

  SkillRatingWidget({Key key, this.skillValue = 0, @required this.selectedBall, @required this.unSelectedBall}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(7, (index) {
            return index < skillValue ? selectedBall : unSelectedBall;
          }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
                '1.0'
            ),
            Text(
                '2.0'
            ),
            Text(
                '3.0'
            ),
            Text(
                '4.0'
            ),
            Text(
                '5.0'
            ),
            Text(
                '6.0'
            ),
            Text(
                '7.0'
            ),
          ],
        ),
      ],
    );
  }
}

class SkillRating extends SkillRatingWidget {
  SkillRating({Key key, int skillValue = 0}) : super (key: key, skillValue: skillValue, selectedBall: Icon(Icons.sports_baseball), unSelectedBall: Icon(Icons.sports_baseball_outlined),);
}