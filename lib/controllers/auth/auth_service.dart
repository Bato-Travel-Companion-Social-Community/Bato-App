import './services/main.dart'
    show LoginService, SignupService, LogoutService, TokenService;

/// AuthService is a central service responsible for managing user authentication processes.
/// It includes methods for logging in, signing up, and logging out by interacting with
/// the respective services: LoginService, SignupService, and LogoutService.
class AuthService {
  // Instances of the login, signup, and logout services

  static const String baseUrl = 'http://10.22.8.44:5001/api/auth';
  final LoginService _loginService = LoginService(baseUrl: baseUrl);
  final SignupService _signupService = SignupService(baseUrl: baseUrl);
  final LogoutService _logoutService = LogoutService();
  final TokenService _tokenService = TokenService();

  /// Login function to authenticate a user.
  ///
  /// This method delegates the login operation to the LoginService and returns any
  /// error message if the login fails, or null if successful.
  ///
  /// [email]: The email address of the user trying to log in.
  /// [password]: The password of the user.
  ///
  /// Returns [String?] - null if login is successful, or an error message if login fails.
  Future<String?> login(String email, String password) async {
    return await _loginService.login(email, password);
  }

  /// Signup function to create a new user account.
  ///
  /// This method delegates the signup operation to the SignupService and returns any
  /// error message if the signup fails, or null if successful.
  ///
  /// [displayName]: The display name of the user.
  /// [username]: The chosen username for the user.
  /// [email]: The email address of the user.
  /// [password]: The password for the user account.
  ///
  /// Returns [String?] - null if signup is successful, or an error message if signup fails.
  Future<String?> signup(String displayName, String username, String email,
      String password) async {
    return await _signupService.signup(displayName, username, email, password);
  }

  /// Logout function to log out the current user.
  ///
  /// This method delegates the logout operation to the LogoutService, which deletes
  /// the stored token and logs out the user.
  Future<void> logout() async {
    await _logoutService.logout();
  }

  /// Checks if the user is logged in by validating if a token exists.
  Future<bool> isUserLoggedIn() async {
    // Remove token for testing
    await _tokenService.deleteToken();
    await _tokenService.printAllStoredData();
    String? token = await _tokenService.getToken(); // Retrieve token
    return token != null && token.isNotEmpty; // Return true if token exists
  }
}
