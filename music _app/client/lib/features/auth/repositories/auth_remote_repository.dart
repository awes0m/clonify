import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthRemoteRepository {
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = http.post(
      Uri.parse('http://10.0.2.2:8000/auth/signup'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': name, 'email': email, 'password': password}),
    );
    print(response);
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    final response = http.post(
      Uri.parse('http://10.0.2.2:8000/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    print(response);
  }
}
