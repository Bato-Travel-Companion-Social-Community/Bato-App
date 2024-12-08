import 'services/index.dart' show GetImagePostsService;
import '../../models/index.dart' show MyCommunityPostModel;

class PostsService {
  static const String baseUrl = 'http://192.168.1.132:5000/api/post';
  final GetImagePostsService _getImagePostsService =
      GetImagePostsService(baseUrl: baseUrl);

  Future<List<MyCommunityPostModel>?> getAllImagePosts() async {
    return await _getImagePostsService.getAllImagePosts();
  }

  // Method to fetch posts specific to a user
  // Method to fetch posts specific to a user or the authenticated user
  //Future<List<MyCommunityPostModel>?> getImagePostsByUser(
  // {String? userId}) async {
  // Pass userId as optional
  // return await _getImagePostsService.getImagePostsByUser(userId: userId);
  // }
}
