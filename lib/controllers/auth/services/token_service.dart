import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenService {
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  // Save the JWT token
  Future<void> saveToken(String token) async {
    try {
      await _secureStorage.write(key: 'jwt_token', value: token);
    } catch (e) {
      print('Error saving token: $e');
    }
  }

  // Read the JWT token
  Future<String?> getToken() async {
    try {
      return await _secureStorage.read(key: 'jwt_token');
    } catch (e) {
      print('Error reading token: $e');
      return null;
    }
  }

  // Delete the JWT token (logout)
  Future<void> deleteToken() async {
    try {
      await _secureStorage.delete(key: 'jwt_token');
    } catch (e) {
      print('Error deleting token: $e');
    }
  }
}
