import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'User.dart';

class UserPreferences {
  static SharedPreferences _preferences;
  static const _keyUser = 'user';
  static const _keyUserName = 'username';

  static final myUser = User.full(
    firstName: 'Sofia',
    lastName: 'Nilsson',
    userName: 'sofiaN',
    email: 'sofia@gmail.com',
    age: 25,
    skillLevel: 3,
    aboutInfo: 'Certified Personal Trainer and Nutritionist with years of experience in creating effective diets and training plans focused on achieving individual customers goals in a smooth way.',

  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());
    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);
    return json == null ? myUser : User.fromJsonFull(jsonDecode(json));
  }
  static User getUserFromSignUp (_keyUserName) {
    final json = _preferences.getString(_keyUserName);
    return User.fromJson(jsonDecode(json));
  }

  static Future setUsername(String userName) async =>
      await _preferences.setString(_keyUserName, userName);
  static String getUserName() => _preferences.getString(_keyUserName);
}