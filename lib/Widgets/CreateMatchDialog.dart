import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateMatchDialog extends StatefulWidget {
  CreateMatchDialog([Key key]) : super(key: key);
  @override
  _CreateMatchDialogState createState() => _CreateMatchDialogState();
}

class _CreateMatchDialogState extends State<CreateMatchDialog> {
  int _selectedNrOfPlayers;

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
                  SizedBox(width: 50,),
                  Container(
                    child: DropdownButton<int>(
                      value: _selectedNrOfPlayers,
                      style: TextStyle(color: Colors.white),
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
                      hint: Text(
                        'Number of players',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                      onChanged: (int value) {
                        setState(() {
                          _selectedNrOfPlayers = value;

                        });
                      },
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