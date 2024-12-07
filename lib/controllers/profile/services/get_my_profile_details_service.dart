import 'dart:convert'; // Import for JSON encoding/decoding
import 'package:http/http.dart' as http; // HTTP client for making requests
import '../../auth/services/index.dart'
    show TokenService; // Importing TokenService to handle token storage
import '../../../models/index.dart'
    show UserModel; // Import MyCommunityPostModel

class GetMyProfileDetailsService {
  final String baseUrl;

  // Constructor to initialize the base URL
  GetMyProfileDetailsService({required this.baseUrl});

  // Instance of TokenService to securely save and manage the JWT token
  final TokenService _tokenService = TokenService();

  Future<UserModel?> getMyProfileDetails() async {
    try {
      final token = await _tokenService.getToken();
      final response = await http.get(
        Uri.parse('$baseUrl/get_my_profile_details'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return UserModel.fromJson(responseData); // Parse single user
      } else {
        final responseData = json.decode(response.body);
        throw Exception(responseData['message'] ?? 'Unknown error');
      }
    } catch (e) {
      print('Error fetching profile: $e');
      return null;
    }
  }
}
