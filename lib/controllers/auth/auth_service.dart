import './services/main.dart' show LoginService, SignupService, LogoutService;

class AuthService {
  final LoginService _loginService = LoginService();
  final SignupService _signupService = SignupService();
  final LogoutService _logoutService = LogoutService();

  // Login function
  Future<String?> login(String email, String password) async {
    return await _loginService.login(email, password);
  }

  // Signup function
  Future<String?> signup(String displayName, String username, String email,
      String password) async {
    return await _signupService.signup(displayName, username, email, password);
  }

  // Logout function
  Future<void> logout() async {
    await _logoutService.logout();
  }
}
