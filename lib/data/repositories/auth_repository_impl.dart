import 'dart:convert';

import 'package:fullstack_taskmanagement/features/Auth/domain/entities/users.dart';
import '../../features/Auth/domain/repository/auth_repository.dart';
import '../models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Users?> signIn(String email, String password) async {
    var response = await http.post(
      Uri.parse("http://10.0.2.2:8000/api/login"),
      body: ({
        "email": email,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print('Login successfully, token: ${data['access_token']}');
      return UserModel.fromJson(data);
    } else {
      print('Failed to register: ${response.body}');
    }
    return null;
  }

  @override
  Future<void> signOut(String token) async {
    var response = await http.post(
      Uri.parse("http://10.0.2.2:8000/api/logout"),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      print('Logged out successfully');
    } else {
      print('Failed to logout: ${response.body}');
    }
  }

  @override
  Future<void> signUp(String name, String email, String password) async {
    var response = await http.post(
      Uri.parse("http://10.0.2.21:8000/api/register"),
      headers: {
        "Content-Type": "application/json",
      },
      body: ({
        "name": name,
        "email": email,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print('Registered successfully, token: ${data['access_token']}');
    } else {
      print('Failed to register: ${response.body}');
    }
  }
}
