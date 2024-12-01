import 'dart:io';

import 'services/index.dart' show AddImagePostService;
import '../../models/index.dart' show MyCommunityPostModel;

class AddPostService {
  static const String baseUrl = 'http://192.168.1.132:5000/api/post';
  final AddImagePostService _addImagePostService =
      AddImagePostService(baseUrl: baseUrl);

  Future<bool> addPostService({
    required List<File> images, // List of File objects
    required String caption,
    required String location,
  }) async {
    return await _addImagePostService.addPost(
        images: images, caption: caption, location: 'Berlin, Germany');
  }
}
