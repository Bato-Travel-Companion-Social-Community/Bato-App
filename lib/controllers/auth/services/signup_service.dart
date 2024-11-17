import 'dart:convert'; // For encoding and decoding JSON
import 'package:http/http.dart' as http; // For making HTTP requests
import 'token_service.dart'; // Importing TokenService to save the JWT token

/// This service handles the signup process for the user.
/// It sends a POST request to the backend API with user details (email, username, etc.)
/// and processes the response to save the authentication token securely.
class SignupService {
  // Base URL of the backend API
  final String baseUrl; // Replace with your backend URL

  // Constructor to initialize the base URL
  SignupService({required this.baseUrl});

  // Instance of TokenService to securely store the authentication token
  final TokenService _tokenService = TokenService();

  /// The signup method sends a POST request to the backend to create a new user.
  ///
  /// It takes the following parameters:
  /// - [displayName]: The display name of the user.
  /// - [username]: The username chosen by the user.
  /// - [email]: The email address of the user.
  /// - [password]: The password selected by the user.
  ///
  /// Returns [null] if signup is successful, or an error message if it fails.
  ///
  /// If successful, the method retrieves a JWT token from the response and securely stores it
  /// using the [TokenService]. The token is used for subsequent requests to authenticate the user.
  Future<String?> signup(String displayName, String username, String email,
      String password) async {
    try {
      // Making the POST request to the signup endpoint
      final response = await http.post(
        Uri.parse('$baseUrl/signup'), // API URL for the signup endpoint
        headers: {'Content-Type': 'application/json'}, // Content type as JSON
        body: json.encode({
          // Request body with user data
          'display_name': displayName,
          'username': username,
          'email': email,
          'password': password,
        }),
      );

      // Handling the response from the server
      if (response.statusCode == 201) {
        // If the response status is 201 (Created), signup is successful
        final responseData =
            json.decode(response.body); // Decode the response body
        final token =
            responseData['token']; // Extract the token from the response

        // Save the token securely using TokenService
        await _tokenService.saveToken(token);

        return null; // Return null to indicate no error
      } else {
        // If the response status is not 201, it means an error occurred
        final responseData =
            json.decode(response.body); // Decode the error response
        return responseData[
            'message']; // Return the error message from the response
      }
    } catch (e) {
      // Catching any exceptions that may occur during the request
      return 'An error occurred during signup: $e'; // Return the error message
    }
  }
}
