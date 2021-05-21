import 'dart:convert';
import 'package:frontend/User.dart';
import 'package:http/http.dart' as http;

class Api {
  final String _baseUrl = "https://group4-75.pvt.dsv.su.se/";

  //TODO: Implement full functionality
Future<User> fetchUser() async {
  final response = await http.get(Uri.https(_baseUrl, 'bb'));
  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load user');
  }
}

}