import 'dart:async';
import 'dart:convert';
import 'package:frontend/UserPreferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/Homescreen.dart';
import 'package:frontend/Match.dart';
import 'package:frontend/Widgets/skillRatingWidget.dart';
import 'package:frontend/locationPicker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'NTRPDialog.dart';

class CreateMatchDialog extends StatefulWidget {
  CreateMatchDialog({Key key}) : super(key: key);
  @override
  _CreateMatchDialogState createState() => _CreateMatchDialogState();
}

class _CreateMatchDialogState extends State<CreateMatchDialog> {
  int _selectedNrOfPlayers;
  int _minSkillLevel = 4;
  int _maxSkillLevel = 4;
  DateTime _date;
  TimeOfDay _startTime;
  TimeOfDay _endTime;
  LatLng _matchLocation;
  Match match;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: matchBox(context),
    );
  }

  String getDateText() {
    if (_date == null){
      return 'Date';
    }else {
      return '${_date.day}/${_date.month}-${_date.year}';
    }
  }

  String getStartTimeText() {
    if (_startTime == null){
      return 'Start Time';
    }else {
      final hours = _startTime.hour.toString().padLeft(2, '0');
      final minutes = _startTime.minute.toString().padLeft(2, '0');

      return '$hours:$minutes';
    }
  }

  String getEndTimeText() {
    if (_endTime == null){
      return 'End Time';
    }else {
      final hours = _endTime.hour.toString().padLeft(2, '0');
      final minutes = _endTime.minute.toString().padLeft(2, '0');

      return '$hours:$minutes';
    }
  }

  String getLocationText() {
    if (_matchLocation == null){
      return 'Choose the location of the match';
    }else {
      return _matchLocation.toString();
    }
  }

  Widget matchBox(BuildContext context) {
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
                                match = null;
                                Navigator.pop(context, match);
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Container(
                          width: 200,
                          height: 70,
                          color: Colors.transparent,
                          child: ElevatedButton(
                            onPressed: () async {
                              final location = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LocationPicker()),
                              );
                              setState(() {
                                _matchLocation = location;
                              });
                            },
                            child: Text(getLocationText()),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.deepOrange,
                              textStyle: TextStyle(fontSize: 15),
                            ),
                          ),
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
                    onPressed: () => pickStartTime(context),
                    child: Text(
                      getStartTimeText(),
                    ),
                  ),
                  SizedBox(width: 50,),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () => pickEndTime(context),
                    child: Text(
                      getEndTimeText(),
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
                    onPressed: () => pickDate(context),
                    child: Text(
                      getDateText(),
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
                          child: Text('$value'),
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
              SizedBox(height: 20,),
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
                        size: 39,),
                      unSelectedBall: Icon(
                        Icons.sports_baseball_outlined,
                        color: Color.fromRGBO(255, 87, 34, 0.5),
                        size: 39,),
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
                                if (_minSkillLevel > _maxSkillLevel){
                                  _maxSkillLevel = _minSkillLevel;
                                }
                              }
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Text(
                    'Choose min skill level',
                  ),
                  SizedBox(width: 15,),
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
                                if (_minSkillLevel > _maxSkillLevel){
                                  _maxSkillLevel = _minSkillLevel;
                                }
                              }
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Container(
                width: 280,
                height: 56,
                child: Stack(
                  children: [
                    SkillRatingWidget(
                      skillValue: _maxSkillLevel,
                      selectedBall: Icon(
                        Icons.sports_baseball,
                        color: Colors.deepOrange,
                        size: 39,),
                      unSelectedBall: Icon(
                        Icons.sports_baseball_outlined,
                        color: Color.fromRGBO(255, 87, 34, 0.5),
                        size: 39,),
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
                              if (_maxSkillLevel > _minSkillLevel){
                                _maxSkillLevel = _maxSkillLevel - 1;
                              }
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Text(
                    'Choose max skill level',
                  ),
                  SizedBox(width: 15,),
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
                              if (_maxSkillLevel < 7){
                                _maxSkillLevel = _maxSkillLevel + 1;
                              }
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(

                      onPressed: () {
                        if (_date != null && _startTime != null && _endTime != null
                            && _selectedNrOfPlayers != null && _matchLocation != null){
                          match = Match(
                            date: _date,
                            startTime: _startTime,
                            endTime: _endTime,
                            numberOfPlayers: _selectedNrOfPlayers,
                            minSkillLevel: _minSkillLevel,
                            maxSkillLevel: _maxSkillLevel,
                            matchLocation: _matchLocation,
                          );
                          Navigator.pop(context, match);
                        }else{
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text('Error!'),
                              content: Text('All field need to be assigned'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(
                                          context,
                                          MaterialPageRoute(builder: (_) => HomeScreen())
                                      );
                                    },
                                    child: Text('Ok')
                                ),
                              ],
                            ),
                          );
                        }
                      },
                     /* onPressed: ()  =>
                             _addMatch(
                           _selectedNrOfPlayers,
                            _minSkillLevel,
                           _maxSkillLevel,
                                  _date,
                            _startTime,
                            _endTime
                            ),*/



                      child: Row(
                        children: [
                          Text(
                            'Post',
                          ),
                          SizedBox(width: 40,),
                          Icon(
                            Icons.arrow_forward,
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepOrange,
                        textStyle: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 255,
          left: 245,
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
        Positioned(
          top: 367,
          left: 245,
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
    );
  }

  Future pickDate(BuildContext context) async {
    final startDate = DateTime.now();
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: _date ?? startDate,
        firstDate: startDate,
        lastDate: DateTime(DateTime.now().year + 5),
    );

    if (pickedDate == null) return;

    setState(() {
      _date = pickedDate;
    });
  }

  Future pickStartTime(BuildContext context) async {
    final initialTime = TimeOfDay.now();
    final pickedStartTime = await showTimePicker(
        context: context,
        initialTime: _startTime ?? initialTime,
    );

    if (pickedStartTime == null) return;
    setState(() {
      _startTime = pickedStartTime;
    });
  }

  void _showErrorDialog(String msg){
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Error!'),
        content: Text(msg),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (_) => HomeScreen())
                );
              },
              child: Text('Ok')
          ),
        ],
      ),
    );
  }

  Future pickEndTime(BuildContext context) async {
    if (_startTime != null) {
      final initialTime = TimeOfDay.now();
      final pickedEndTime = await showTimePicker(
        context: context,
        initialTime: _endTime ?? _startTime ?? initialTime,
      );
      if (pickedEndTime == null) return;
      if (pickedEndTime.hour >= _startTime.hour){
        if (pickedEndTime.hour == _startTime.hour){
          if (pickedEndTime.minute > _startTime.minute){
            setState(() {
              _endTime = pickedEndTime;
            });
          }else {
            _showErrorDialog('Minute : End time can not be before the start time');
          }
        }else{
          setState(() {
            _endTime = pickedEndTime;
          });
        }
      }else{
        _showErrorDialog('End time can not be before the start time');
      }
    }else{
      _showErrorDialog('Pick a start time first');
    }
  }

  Future<Match> _addMatch(_selectedNrOfPlayers, _minSkillLevel, _maxSkillLevel, date,
      startTime, endTime) async {
    String userName = UserPreferences.getUserName();
    String matchlocation = "59.3536164,18.041846";
    var reqBody = new Map();

    reqBody['minSkillLevel'] = _minSkillLevel;
    reqBody['maxSkillLevel'] =_maxSkillLevel;
    reqBody['numberOfPlayers'] =_selectedNrOfPlayers;
    reqBody['startTime'] = startTime.toString();
    reqBody['endTime'] = endTime.toString();
    reqBody['date'] = date.toString();
    reqBody['position'] = matchlocation;
    reqBody['username'] =  userName;

    var res = await http.post(
        Uri.parse("http://localhost:8080/match/add"), body:
    jsonEncode(reqBody)

    );

    if (res.statusCode == 200) {

      match = Match(
        date: _date,
        startTime: _startTime,
        endTime: _endTime,
        numberOfPlayers: _selectedNrOfPlayers,
        minSkillLevel: _minSkillLevel,
        maxSkillLevel: _maxSkillLevel,
        matchLocation: _matchLocation,
      );


      Navigator.pop(context, match);


    } else
    displayDialog(context, "Something went wrong",
    "Unable to add match");

  }

  void displayDialog(context, title, text) => showDialog(
    context: context,
    builder: (context) =>
        AlertDialog(title: Text(title), content: Text(text)),
  );

}