import 'token_service.dart'; // Importing TokenService to manage token storage

/// This service handles the logout process for the user.
/// It deletes the authentication token from secure storage to effectively log the user out.
class LogoutService {
  // Instance of TokenService to manage the token-related operations (deletion in this case)
  final TokenService _tokenService = TokenService();

  /// The logout method removes the user's JWT token from secure storage,
  /// effectively logging them out of the system.
  ///
  /// The method does not return any value, as the process is expected to be silent and only
  /// perform the action of deleting the token.
  ///
  /// Throws an error if there is an issue deleting the token from storage.
  Future<void> logout() async {
    try {
      // Delete the token from secure storage using the TokenService
      await _tokenService
          .deleteToken(); // Remove the stored token to log the user out
    } catch (e) {
      // In case of an error, print or log the issue
      print("Error during logout: $e");
    }
  }
}
