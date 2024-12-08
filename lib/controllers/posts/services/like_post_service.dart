import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../auth/services/index.dart' show TokenService;

class LikePostService {
  final String baseUrl;
  final TokenService _tokenService = TokenService();

  LikePostService({required this.baseUrl});

  Future<Map<String, dynamic>?> toggleLike(String postId) async {
    try {
      final token = await _tokenService.getToken();

      final response = await http.post(
        Uri.parse('$baseUrl/test_post/$postId/like'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        print('Error status code: ${response.statusCode}');
        print('Error response body: ${response.body}');
        throw Exception('Failed to toggle like: ${response.statusCode}');
      }
    } catch (e) {
      print('Error toggling like: $e');
      return null;
    }
  }
}
