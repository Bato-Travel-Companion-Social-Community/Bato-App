import 'dart:convert'; // Import for JSON encoding/decoding
import 'package:http/http.dart' as http; // HTTP client for making requests
import 'token_service.dart'; // Importing TokenService to handle token storage

/// This service handles the login process of the user.
/// It makes an HTTP POST request to the backend server to authenticate the user
/// with their email and password. Upon successful login, it saves the authentication
/// token securely for subsequent API calls.
class LoginService {
  // The base URL of the backend authentication API
  // Replace with your actual backend URL when deploying to production
  final String baseUrl = 'http://10.22.8.69:5000/api/auth';

  // Instance of TokenService to securely save and manage the JWT token
  final TokenService _tokenService = TokenService();

  /// The login method attempts to authenticate the user by sending their credentials to the backend.
  ///
  /// [email] - The email of the user attempting to log in.
  /// [password] - The password of the user attempting to log in.
  ///
  /// Returns null if the login is successful, or an error message (String) if the login fails.
  ///
  /// Throws an error if the HTTP request fails or if there's an issue with the network connection.
  Future<String?> login(String email, String password) async {
    try {
      // Making an HTTP POST request to the backend to send the login credentials
      final response = await http.post(
        Uri.parse('$baseUrl/signin'), // The API endpoint for signing in
        headers: {'Content-Type': 'application/json'}, // Sending JSON content
        body: json.encode({
          // Encoding the login credentials as JSON
          'email': email,
          'password': password,
        }),
      );

      // Checking if the response status code is 200, indicating a successful login
      if (response.statusCode == 200) {
        // Decode the JSON response body into a Dart Map
        final responseData = json.decode(response.body);
        final token =
            responseData['token']; // Extracting the token from the response

        // Save the token securely using TokenService
        await _tokenService.saveToken(token);

        return null; // Returning null indicates successful login, no error
      } else {
        // If the server returns an error, decode the error message
        final responseData = json.decode(response.body);
        return responseData[
            'message']; // Returning the error message from the server
      }
    } catch (e) {
      // If an exception occurs (e.g., network issue), return a generic error message
      return 'An error occurred: $e';
    }
  }
}
