import 'package:http/http.dart' as http; // HTTP client for making requests
import 'package:http_parser/http_parser.dart'; // For setting content type
import 'dart:io'; // For file handling
import 'package:mime/mime.dart'; // For MIME type lookup
import '../../auth/services/index.dart'
    show TokenService; // Import TokenService

class AddImagePostService {
  final String baseUrl;

  // Constructor to initialize the base URL
  AddImagePostService({required this.baseUrl});

  // Instance of TokenService to securely save and manage the JWT token
  final TokenService _tokenService = TokenService();

  Future<bool> addPost({
    required List<File> images, // List of File objects
    required String caption,
    required String location,
  }) async {
    try {
      final token = await _tokenService.getToken();
      if (token == null) {
        throw Exception('No token found');
      }

      // Create a multipart request
      var request =
          http.MultipartRequest('POST', Uri.parse('$baseUrl/add_image_post'))
            ..headers.addAll({
              'Authorization': 'Bearer $token',
            });

      // Add images as multipart files
      for (var image in images) {
        var mimeType = lookupMimeType(image.path) ??
            'image/jpeg'; // Get MIME type of the image
        request.files.add(await http.MultipartFile.fromPath(
          'images[]',
          image.path,
          contentType: MediaType('image', mimeType),
        ));
      }

      // Add other form fields
      request.fields['caption'] = caption;
      request.fields['location'] = location;

      // Send the request and await response
      var response = await request.send();

      if (response.statusCode == 200) {
        print('Post added successfully');
        return true;
      } else {
        final responseData = await response.stream.bytesToString();
        print('Error: ${response.statusCode}, $responseData');
        return false;
      }
    } catch (e) {
      print('Error adding post: $e');
      return false;
    }
  }
}
