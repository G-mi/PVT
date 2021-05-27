import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/Widgets/skillRatingWidget.dart';

import '../NTRPDialog.dart';

class CreateMatchDialog extends StatefulWidget {
  CreateMatchDialog([Key key]) : super(key: key);
  @override
  _CreateMatchDialogState createState() => _CreateMatchDialogState();
}

class _CreateMatchDialogState extends State<CreateMatchDialog> {
  int _selectedNrOfPlayers;
  int _minSkillLevel = 4;
  int _maxSkillLevel = 4;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: matchBox(context),
    );
  }

  Widget matchBox(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 280,
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
                              onPressed: () {},
                            ),
                          ],
                        ),
                        Container(
                          width: 240,
                          height: 105,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Start time',
                    ),
                  ),
                  SizedBox(width: 50,),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {},
                    child: Text(
                      'End time',
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Date',
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text(
                    'Number of players',
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                  SizedBox(width: 5,),
                  Container(
                    child: DropdownButton<int>(
                      value: _selectedNrOfPlayers,
                      dropdownColor: Colors.green,
                      iconDisabledColor: Colors.green,
                      iconEnabledColor: Colors.green,
                      style: TextStyle(color: Colors.black),
                      items: <int>[
                        2,
                        3,
                        4,
                      ].map<DropdownMenuItem<int>>((int value) {
                        return DropdownMenuItem<int> (
                          value: value,
                          child: Text('${value}'),
                        );
                      }).toList(),
                      onChanged: (int value) {
                        setState(() {
                          _selectedNrOfPlayers = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Container(
                width: 280,
                height: 56,
                child: Stack(
                  children: [
                    SkillRatingWidget(
                      skillValue: _minSkillLevel,
                      selectedBall: Icon(
                        Icons.sports_baseball,
                        color: Colors.deepOrange,
                        size: 35,),
                      unSelectedBall: Icon(
                        Icons.sports_baseball_outlined,
                        color: Color.fromRGBO(255, 87, 34, 0.5),
                        size: 35,),
                    ),
                    Positioned(
                      top: -13,
                      left: 235,
                      child: IconButton(
                        icon: Icon(Icons.info),
                        iconSize: 27,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => NTRPDialog()
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: ClipOval(
                      child: Container(
                        color: Colors.deepOrange,
                        child:  IconButton(
                          icon: Icon(Icons.remove),
                          iconSize: 25,
                          color: Colors.white,
                          onPressed: () {
                            setState(() {
                              if (_minSkillLevel > 1){
                                _minSkillLevel = _minSkillLevel - 1;
                              }
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5,),

                  SizedBox(width: 5,),
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: ClipOval(
                      child: Container(
                        color: Colors.deepOrange,
                        child:  IconButton(
                          icon: Icon(Icons.add),
                          iconSize: 25,
                          color: Colors.white,
                          onPressed: () {
                            setState(() {
                              if (_minSkillLevel < 7){
                                _minSkillLevel = _minSkillLevel + 1;
                              }
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}