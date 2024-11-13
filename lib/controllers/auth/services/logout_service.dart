import 'token_service.dart';

class LogoutService {
  final TokenService _tokenService = TokenService();

  Future<void> logout() async {
    await _tokenService.deleteToken(); // Delete the token from storage
  }
}
