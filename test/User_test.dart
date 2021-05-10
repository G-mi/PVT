import 'package:flutter_test/flutter_test.dart';
import '../lib/Friend.dart';
import '../lib/User.dart';


main(){
  test("Friends initialized", (){
    User user = getTestUser();

    for(int i = 0; i < user.getFriendsTest().length; i++)
      expect(debugFriends[i] == user.getFriendsTest()[i], true);
  });

  test("Name initialized", (){
    String name = "bo olsson";
    User user = getTestUser();

    expect(name, user.getFullName());
  });
}




List<Friend> debugFriends = [
  new Friend(userName: 'Bengt'),
  new Friend(userName: 'Sara'),
  new Friend(userName: 'Monica')
];

User getTestUser(){
  return new User('bo', 'olsson', 'bolo');
}