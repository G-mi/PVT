

class Friend {
  String userName;

  Friend({
    this.userName
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Friend &&
              runtimeType == other.runtimeType &&
              userName == other.userName;

  @override
  int get hashCode => userName.hashCode;

}