// lib/services/login_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'token_service.dart';

class LoginService {
  final String baseUrl =
      'http://your-backend-url/api'; // Replace with your backend URL
  final TokenService _tokenService = TokenService();

  Future<String?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final token = responseData['token'];

      // Save the token securely
      await _tokenService.saveToken(token);

      return null; // No error, login successful
    } else {
      final responseData = json.decode(response.body);
      return responseData['message'];
    }
  }
}
