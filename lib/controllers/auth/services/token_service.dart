import 'package:flutter_secure_storage/flutter_secure_storage.dart'; // Secure storage for sensitive data

/// This service is responsible for securely managing the JWT token.
/// It allows saving, retrieving, and deleting the token from the secure storage.
class TokenService {
  // Instance of FlutterSecureStorage to securely store and retrieve the JWT token
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  /// Saves the provided JWT token securely in storage.
  ///
  /// This method stores the token using the key 'jwt_token'.
  ///
  /// [token]: The JWT token to be saved.
  ///
  /// Throws an error if saving the token fails.
  Future<void> saveToken(String token) async {
    try {
      // Writing the token into secure storage with the key 'jwt_token'
      await _secureStorage.write(key: 'jwt_token', value: token);
    } catch (e) {
      // If an error occurs while saving the token, print the error
      print('Error saving token: $e');
    }
  }

  /// Retrieves the JWT token from secure storage.
  ///
  /// This method reads the token stored with the key 'jwt_token'.
  /// If the token is found, it returns the token, otherwise it returns null.
  ///
  /// Returns a [String?] representing the token if it exists, or null if not.
  ///
  /// Throws an error if reading the token fails.
  Future<String?> getToken() async {
    try {
      // Reading the token from secure storage using the key 'jwt_token'
      return await _secureStorage.read(key: 'jwt_token');
    } catch (e) {
      // If an error occurs while reading the token, print the error
      print('Error reading token: $e');
      return null; // Return null if the token is not found or an error occurs
    }
  }

  /// Deletes the JWT token from secure storage.
  ///
  /// This method is called when the user logs out. It removes the token stored under the key 'jwt_token'.
  ///
  /// Throws an error if deleting the token fails.
  Future<void> deleteToken() async {
    try {
      // Deleting the token from secure storage
      await _secureStorage.delete(key: 'jwt_token');
    } catch (e) {
      // If an error occurs while deleting the token, print the error
      print('Error deleting token: $e');
    }
  }

  Future<void> printAllStoredData() async {
    final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

    // Retrieve all key-value pairs stored in Secure Storage
    Map<String, String> allData = await _secureStorage.readAll();

    // Print the data to the console
    allData.forEach((key, value) {
      print('Key: $key, Value: $value');
    });
  }
}
