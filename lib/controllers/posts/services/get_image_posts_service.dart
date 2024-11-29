import 'dart:convert'; // Import for JSON encoding/decoding
import 'package:http/http.dart' as http; // HTTP client for making requests
import '../../auth/services/index.dart'
    show TokenService; // Importing TokenService to handle token storage
import '../../../models/index.dart'
    show MyCommunityPostModel; // Import MyCommunityPostModel

class GetImagePostsService {
  final String baseUrl;

  // Constructor to initialize the base URL
  GetImagePostsService({required this.baseUrl});

  // Instance of TokenService to securely save and manage the JWT token
  final TokenService _tokenService = TokenService();

  Future<List<MyCommunityPostModel>?> getAllImagePosts() async {
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
        final List<dynamic> responseData = json.decode(response.body);

        // Convert JSON to List<MyCommunityPostModel>
        return responseData
            .map((postJson) => MyCommunityPostModel.fromJson(postJson))
            .toList();
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
