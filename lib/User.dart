import 'Friend.dart';

class User {
  String firstName;
  String lastName;
  String userName;
  List<Friend> friends;
  List<Match> plannedMatches;

  User({
    this.firstName,
    this.lastName,
    this.userName,
    this.friends,
    this.plannedMatches
});

  void getFriends(){
    this.friends = debugFriends; //Debug test
  }

  String getFullName(){
    return firstName + ' ' + lastName;
  }

  final debugFriends = [
    new Friend(userName: 'Bengt'),
    new Friend(userName: 'Sara'),
    new Friend(userName: 'Monica')
  ];
}