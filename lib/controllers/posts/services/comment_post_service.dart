import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../auth/services/index.dart' show TokenService;
import '../../../models/index.dart' show Comment;

class CommentPostService {
  final String baseUrl;
  final TokenService _tokenService = TokenService();

  CommentPostService({required this.baseUrl});

  Future<Map<String, dynamic>?> addComment(String postId, String text) async {
    try {
      final token = await _tokenService.getToken();
      final response = await http.post(
        Uri.parse('$baseUrl/test_post/$postId/comment'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({'text': text}),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 201) {
        final responseData = json.decode(response.body);
        return {
          'comment': Comment.fromJson(responseData),
          'commentCount': responseData['commentCount'] ?? 1,
        };
      } else {
        print('Error adding comment: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error adding comment: $e');
      return null;
    }
  }

  Future<List<Comment>> getComments(String postId) async {
    try {
      final token = await _tokenService.getToken();
      final response = await http.get(
        Uri.parse('$baseUrl/test_post/$postId/comments'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> commentsJson = json.decode(response.body);
        return commentsJson.map((json) => Comment.fromJson(json)).toList();
      } else {
        print('Error getting comments: ${response.body}');
        return [];
      }
    } catch (e) {
      print('Error getting comments: $e');
      return [];
    }
  }
}
