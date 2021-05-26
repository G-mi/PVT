import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SkillRatingWidget extends StatelessWidget {
  final int skillValue;
  final Widget selectedBall;
  final Widget unSelectedBall;

  SkillRatingWidget({Key key, this.skillValue = 0, @required this.selectedBall, @required this.unSelectedBall}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return index < skillValue ? selectedBall : unSelectedBall;
      }),
    );
  }
}

class SkillRating extends SkillRatingWidget {
  SkillRating({Key key, int skillValue = 0}) : super (key: key, skillValue: skillValue, selectedBall: Icon(Icons.sports_baseball), unSelectedBall: Icon(Icons.sports_baseball_outlined),);
}