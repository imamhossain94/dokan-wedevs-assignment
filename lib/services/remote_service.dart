import 'dart:convert';

import 'package:dokan_wedevs_assignment/models/signup.dart';
import 'package:dokan_wedevs_assignment/models/user.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  static var client = http.Client();
  static const _baseURL = "https://newagedevs.com/wp-json";

  static Future<User?> loginUser(
      {required String userName, required String password}) async {
    var response = await client.post(Uri.parse('$_baseURL/jwt-auth/v1/token'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{"username": userName, "password": password}));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      final Map<String, dynamic> data = json.decode(jsonString);
      return User.fromJson(data);
    } else {
      //show error message
      return null;
    }
  }

  static Future<SignUp?> registerUser(
      {required String userName,
      required String email,
      required String password}) async {
    var response = await client.post(Uri.parse('$_baseURL/wp/v2/users/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{"username": userName, "email":email,"password": password}));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      final Map<String, dynamic> data = json.decode(jsonString);
      return SignUp.fromJson(data);
    } else {
      //show error message
      return null;
    }
  }
}
