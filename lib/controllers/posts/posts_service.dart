import 'services/main.dart' show GetImagePostsService;

class PostsService {
  static const String baseUrl = 'http://192.168.1.132:5000/api/post';
  final GetImagePostsService _getImagePostsService =
      GetImagePostsService(baseUrl: baseUrl);

  Future<List<dynamic>?> getAllImagePosts() async {
    return await _getImagePostsService.getAllImagePosts();
  }
}
