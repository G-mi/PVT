import 'Friend.dart';

class User {
  String firstName;
  String lastName;
  String userName;
  String email;
  String aboutInfo;
  String profilePicturePath;
  String gender;
  int skillLevel;
  int age;
  List<Friend> friends;
  List<Match> plannedMatches;

  User(
    this.firstName,
    this.lastName,
    this.email,
    this.aboutInfo,
    this.gender,
    this.skillLevel,
    this.age,
    this.profilePicturePath,
    this.userName){
    getFriends();
  }

  void getFriends(){
    this.friends = debugFriends; //Debug test
  }

  List<Friend> getFriendsTest(){
    return this.friends;
  }

  String getFullName(){
    return firstName + ' ' + lastName;
  }

  List<Friend> debugFriends = [
    new Friend(userName: 'Bengt'),
    new Friend(userName: 'Sara'),
    new Friend(userName: 'Monica')
  ];
}