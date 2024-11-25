import 'services/index.dart' show GetImagePostsService;

class PostsService {
  static const String baseUrl = 'http://192.168.1.141:5000/api/post';
  final GetImagePostsService _getImagePostsService =
      GetImagePostsService(baseUrl: baseUrl);

  Future<List<dynamic>?> getAllImagePosts() async {
    return await _getImagePostsService.getAllImagePosts();
  }
}
