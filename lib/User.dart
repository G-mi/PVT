import 'Friend.dart';

class User {
  String firstName;
  String lastName;
  String userName;
  String email;
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

  User.full(
      this.firstName,
      this.lastName,
      this.userName,
      this.email,
      this.age,
      this.skillLevel,
      );

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

    //TODO: Complete with all data that is to be loaded
  factory User.fromJson(Map<String, dynamic> json){
    return User.namesOnly(
        json['firstName'],
        json['lastName'],
        json['userName']);
  }

  factory User.fromJsonFull(Map<String, dynamic> json){
    return User.full(
        json['firstName'],
        json['lastName'],
        json['name'],
        json['email'],
        json['age'],
        json['skillLevel']);
  }
}