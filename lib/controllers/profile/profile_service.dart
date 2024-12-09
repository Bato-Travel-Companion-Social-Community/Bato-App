import 'services/index.dart' show GetMyProfileDetailsService;
import '../../models/index.dart' show UserModel;

class ProfileService {
  static const String baseUrl = 'http://192.168.1.132:5001/api/profile';
  final GetMyProfileDetailsService _getMyProfileDetails =
      GetMyProfileDetailsService(baseUrl: baseUrl);

  Future<UserModel?> getMyProfileDetails() async {
    return await _getMyProfileDetails.getMyProfileDetails();
  }
}
