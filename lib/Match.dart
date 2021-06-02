

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Match{

  DateTime date;
  TimeOfDay startTime;
  TimeOfDay endTime;
  int numberOfPlayers;
  //int freeSlots;
  int minSkillLevel;
  int maxSkillLevel;
  LatLng matchLocation;


  //List<String> participants;

  Match(
      {
        this.date,
        this.startTime,
        this.endTime,
        this.numberOfPlayers,
        this.minSkillLevel,
        this.maxSkillLevel,
        this.matchLocation
      });

  factory Match.fromJsonFull(Map<String, dynamic> json){
    return Match (

      date: DateTime.parse(json['date']),
      startTime: TimeOfDay.fromDateTime(DateTime.parse(json['startTime'])),
      endTime: TimeOfDay.fromDateTime(DateTime.parse(json['endTime'])),
      numberOfPlayers: json['numberOfPayers'],
      minSkillLevel: json['minSkillLevel'],
      maxSkillLevel: json['maxSkillLevel'],
      //todo:: parse to latlng
      matchLocation: LatLng(double.parse(json['latitude']), double.parse(json['longitude'])),
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'date' : date.toString(),
      'startTime' : startTime.toString(),
      'endTime' :endTime.toString(),
      'numberOfPLayers' : numberOfPlayers,
      'minSkillLevel' : minSkillLevel,
      'maxSkillLevel' : maxSkillLevel,
      'matchLocation' : matchLocation,

    };
  }

  TimeOfDay fromString(String time) {
    int hh = 0;
    if (time.endsWith('PM')) hh = 12;
    time = time.split(' ')[0];
    return TimeOfDay(
      hour: hh + int.parse(time.split(":")[0]) % 24, // in case of a bad time format entered manually by the user
      minute: int.parse(time.split(":")[1]) % 60,
    );
  }

}
