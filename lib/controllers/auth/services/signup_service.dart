import 'dart:convert';
import 'package:http/http.dart' as http;
import 'token_service.dart';

class SignupService {
  final String baseUrl =
      'http://localhost:5000/api/auth'; // Replace with your backend URL
  final TokenService _tokenService = TokenService();

  Future<String?> signup(String displayName, String username, String email,
      String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/signup'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'display_name': displayName,
          'username': username,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 201) {
        final responseData = json.decode(response.body);
        final token = responseData['token'];

        // Save the token securely
        await _tokenService.saveToken(token);

        return null; // No error, signup successful
      } else {
        final responseData = json.decode(response.body);
        return responseData['message'];
      }
    } catch (e) {
      return 'An error occurred during signup: $e';
    }
  }
}
