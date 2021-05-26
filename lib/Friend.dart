

class Friend {
  String userName;

  Friend(
    this.userName
  );

  factory Friend.fromJson(Map<String, dynamic> json){
    return Friend(
        json['userName']);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Friend &&
              runtimeType == other.runtimeType &&
              userName == other.userName;

  @override
  int get hashCode => userName.hashCode;

}