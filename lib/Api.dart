import 'dart:convert';
import 'package:frontend/User.dart';
import 'package:http/http.dart' as http;

class Api {
  final String _baseUrl = "https://group4-75.pvt.dsv.su.se/";

  //TODO: Implement full functionality
Future<User> signin() async {
  final response = await http.get(Uri.https(_baseUrl, 'signin'));
  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load user');
  }
}

//TODO: Implement with proper password safety
  Future<http.Response> signup(String userName, String email, String pass) async {
    var res = await http.post(
      Uri.https(_baseUrl,'signup'),
      body: json.encode({'userName': userName, 'email': email, 'password': pass}),
    );
    print(res.statusCode);
    print(res.body);
  }

  Future<http.Response> deleteAccount(String userName, String pass) async {
    var res = await http.delete(
      Uri.https(_baseUrl,'deleteuser'),
      body: json.encode({'userName': userName, 'password': pass}),
    );
    print(res.statusCode);
    print(res.body);
  }

  //Should be different from signin
  Future<User> getUser(String userName, String email, String pass) async {
    final response = await http.get(Uri.https(_baseUrl, 'signin'));
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }

}