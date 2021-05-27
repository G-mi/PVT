import 'dart:html';
import 'dart:io';

import 'Friend.dart';

class User {
  String firstName;
  String lastName;
  String userName;
  String email;
  String aboutInfo;
  String imagePath;
  int skillLevel;
  int age;
  List<Friend> friends;
  List<Match> plannedMatches;
  String profilePicturePath;

  //String aboutInfo;
  //String gender;


  User.namesOnly(
      this.firstName,
      this.lastName,
      this.userName) {
    getFriends();
  }

  User(
      this.firstName,
      this.lastName,
      this.userName,
      this.age);

  User.full({
    this.firstName,
    this.lastName,
    this.userName,
    this.email,
    this.aboutInfo,
    this.imagePath,
    this.age,
    this.skillLevel,
  });

  void getFriends(){
    this.friends = debugFriends; //Debug test
  }

  List<Friend> getFriendsTest(){
    return this.friends;
  }

  String getFullName(){
    return firstName + ' ' + lastName;
  }

  final List<Friend> debugFriends = [
    new Friend('Bengt'),
    new Friend('Sara'),
    new Friend('Monica')
  ];

  User copy({
    String firstName,
    String lastName,
    String userName,
    String email,
    String aboutInfo,
    String imagePath,
    int age,
    int skillLevel,
  }) => User.full(
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    userName: userName ?? this.userName,
    email: email ?? this.email,
    aboutInfo: aboutInfo ?? this.aboutInfo,
    imagePath: imagePath ?? this.imagePath,
    age: age ?? this.age,
    skillLevel: skillLevel ?? this.skillLevel,
  );



    //TODO: Complete with all data that is to be loaded
  factory User.fromJson(Map<String, dynamic> json){
    return User.namesOnly(
        json['firstName'],
        json['lastName'],
        json['userName']);
  }

  factory User.fromJsonFull(Map<String, dynamic> json){
    return User.full(
        firstName: json['firstName'],
        lastName: json['lastName'],
        userName: json['userName'],
        email: json['email'],
        aboutInfo: json['aboutInfo'],
        imagePath: json['imagePath'],
        age: json['age'],
        skillLevel: json['skillLevel'],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'firstName' : firstName,
      'lastName' : lastName,
      'userName' : userName,
      'email' : email,
      'aboutInfo' : aboutInfo,
      'imagePath' : imagePath,
      'age' : age,
      'skillLevel' : skillLevel,
    };
  }
}