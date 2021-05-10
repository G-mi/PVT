import 'Friend.dart';

class User {
  String firstName;
  String lastName;
  String userName;
  List<Friend> friends;
  List<Match> plannedMatches;

  User(
    this.firstName,
    this.lastName,
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