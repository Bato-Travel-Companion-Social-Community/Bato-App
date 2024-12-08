import 'services/index.dart' show GetImagePostsService;
import '../../models/index.dart' show MyCommunityPostModel;

class PostsService {
  static const String baseUrl = 'http://192.168.1.132:5001/api/post';
  final GetImagePostsService _getImagePostsService =
      GetImagePostsService(baseUrl: baseUrl);

  Future<List<MyCommunityPostModel>?> getAllImagePosts() async {
    return await _getImagePostsService.getAllImagePosts();
  }
}
