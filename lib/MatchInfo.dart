import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/Match.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'Widgets/skillRatingWidget.dart';

class MatchInfo extends StatefulWidget{
  final Match match;
  MatchInfo({Key key, @required this.match}) : super(key:key);

  @override
  _MatchInfoState createState() => _MatchInfoState();
}

class _MatchInfoState extends State<MatchInfo> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: infoBox(context),
    );
  }

  Widget infoBox(BuildContext context) {
    LatLng position = widget.match.matchLocation;
    DateTime date = widget.match.date;
    TimeOfDay start = widget.match.startTime;
    TimeOfDay end = widget.match.endTime;
    int numberOfPlayers = widget.match.numberOfPlayers;
    int minSkillLevel = widget.match.minSkillLevel;
    int maxSkillLevel = widget.match.maxSkillLevel;
    return Stack(
      children: [
        Container(
          width: 285,
          height: 550,
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
              Stack(
                children: [
                  Container(
                    width: 280,
                    height: 160,
                    color: Colors.green,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 110,),
                            Text(
                              'Match!',
                              style: (TextStyle(color: Colors.white, fontSize: 20)),
                            ),
                            SizedBox(width: 58,),
                            IconButton(
                              icon: Icon(Icons.close),
                              color: Colors.white,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Container(
                          width: 200,
                          height: 70,
                          color: Colors.white,
                          child: Center(
                            child: Text(
                              position.toString(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10,),
                  Text(
                    'Time: ',
                    style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 15,
                    ),
                  ),
                  SizedBox(width: 5,),
                  Text(
                    '${start.hour.toString().padLeft(2, '0')}:${start.minute.toString().padLeft(2, '0')}',
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    ' - ',
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '${end.hour.toString().padLeft(2, '0')}:${end.minute.toString().padLeft(2, '0')}',
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10,),
                  Text(
                    'Date: ',
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text(
                    '${date.day}/${date.month}-${date.year}',
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment(-0.9, 0.0),
                child: Text(
                  'Number of players interested',
                ),
              ),
              SizedBox(height: 10,),
              Row(
                children: List.generate(numberOfPlayers, (index) {
                  return Icon(Icons.account_circle, size: 50,);
                }),
              ),
              SizedBox(height: 5,),
              Text(
                'Preferred min skill level '
              ),
              SizedBox(height: 10,),
              Container(
                width: 300,
                height: 70,
                color: Colors.transparent,
                child: SkillRatingWidget(
                  skillValue: minSkillLevel,
                  selectedBall: Icon(Icons.sports_baseball, color: Colors.deepOrange, size: 35,),
                  unSelectedBall: Icon(Icons.sports_baseball_outlined, color: Color.fromRGBO(255, 87, 34, 0.5), size: 35,),
                ),
              ),
              SizedBox(height: 5,),
              Text(
                  'Preferred max skill level '
              ),
              SizedBox(height: 10,),
              Container(
                width: 300,
                height: 70,
                color: Colors.transparent,
                child: SkillRatingWidget(
                  skillValue: maxSkillLevel,
                  selectedBall: Icon(Icons.sports_baseball, color: Colors.deepOrange, size: 35,),
                  unSelectedBall: Icon(Icons.sports_baseball_outlined, color: Color.fromRGBO(255, 87, 34, 0.5), size: 35,),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}