import 'services/main.dart' show GetImagePostsService;

class PostsService {
  static const String baseUrl = 'http://10.22.8.44:5001/api/post';
  final GetImagePostsService _getImagePostsService =
      GetImagePostsService(baseUrl: baseUrl);

  Future<List<dynamic>?> getAllImagePosts() async {
    return await _getImagePostsService.getAllImagePosts();
  }
}
