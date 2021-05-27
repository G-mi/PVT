import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NTRPDialog extends StatefulWidget {
  NTRPDialog([Key key]) : super(key: key);
  @override
  _NTRPDialogState createState() => _NTRPDialogState();
}

class _NTRPDialogState extends State<NTRPDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: informationBox(context),
    );
  }

  Widget informationBox(BuildContext context){
    return Stack(
      children: [
        Container(
          width: 320,
          height: 516,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            border: Border.all(
              color: Colors.black,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 5,),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 6,
                ),
                width: 260,
                height: 461,
                child: Column(
                  children: [
                    Text(
                        'NTRP PLAYER RATING SCALE'
                    ),
                    SizedBox(height: 15,),
                    Text(
                        '1.0'
                    ),
                    Text(
                        'The player is just starting to play tennis.'
                    ),
                    SizedBox(height: 5,),
                    Text(
                        '2.0'
                    ),
                    Text(
                        'The player needs on-court experience. But is familiar with the basics'
                    ),
                    SizedBox(height: 5,),
                    Text(
                        '3.0'
                    ),
                    Text(
                        'The player is consistent when hitting medium pace shots, but is not comfortable with all strokes or powers.'
                    ),
                    SizedBox(height: 5,),
                    Text(
                        '4.0'
                    ),
                    Text(
                        'This player has dependable strokes, including forehand, backhand shots.'
                    ),
                    SizedBox(height: 5,),
                    Text(
                        '5.0'
                    ),
                    Text(
                        'The player has good shot anticipation The player can regularly hit winners or force errors off of short balls. The player is comfortable with all strokes'
                    ),
                    SizedBox(height: 5,),
                    Text(
                        '6.0'
                    ),
                    Text(
                        'The player has had intensive training for national tournament competition'
                    ),
                    SizedBox(height: 5,),
                    Text(
                        '7.0'
                    ),
                    Text(
                        'player who is committed to tournament competition on the international level and whose major source of income is tournament prize winnings'
                    ),
                  ],
                ),
              ),
              Align(
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}