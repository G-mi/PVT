
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
}