import 'dart:convert'; // Import for JSON encoding/decoding
import 'package:http/http.dart' as http; // HTTP client for making requests
import '../../auth/services/index.dart'
    show TokenService; // Importing TokenService to handle token storage

class GetImagePostsService {
  final String baseUrl;

  // Constructor to initialize the base URL
  GetImagePostsService({required this.baseUrl});

  // Instance of TokenService to securely save and manage the JWT token
  final TokenService _tokenService = TokenService();

  Future<List<dynamic>?> getAllImagePosts() async {
    try {
      final token = await _tokenService.getToken();
      final response = await http.get(
        Uri.parse('$baseUrl/get_image_posts'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        print(response.body);
        return json.decode(response.body); // Directly return the list of posts
      } else {
        final responseData = json.decode(response.body);
        throw Exception(responseData['message'] ?? 'Unknown error');
      }
    } catch (e) {
      print('Error fetching posts: $e');
      return null;
    }
  }
}
