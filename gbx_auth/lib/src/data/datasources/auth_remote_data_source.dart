/// [AuthRemoteDataSource] to Handle authentication.
abstract class AuthRemoteDataSource {
  /// Get the current user id from the server.
  ///
  /// Throws [UserNotLoggedInException] if the user is not logged in.
  Future<String> getUser();

  /// Login and returns the user id
  ///
  /// Throws [AuthException] if the user can't log in.
  Future<String> logInWithEmail(String email, String password);

  /// Sign up a new user and return the user id.
  ///
  /// Throws [AuthException] if the user can't sign up.
  Future<String> signUpWithEmail(String email, String password);

  /// Send an email containing a code for reseting the password
  ///
  /// Throws [ChangePasswordException] if the server fails to send the reset code
  Future<void> changePasswordRequest(String email);

  /// Verify if the code is valid for reseting the password.
  ///
  /// Throws [InvalidResetCodeException] if there is any errors.
  /// returns the email for that code.
  Future<String> verifyPasswordResetCode(String code);

  /// Change password
  ///
  /// Throws [ResetPasswordException] if there is any errors changing password.
  Future<void> changePassword(String code, String newPassword);

  /// Log the user in with cached credentials and return the current user id
  ///
  /// Throws [NoCachedUserException] if there no credentials are found.
  Future<String> backgroundLogin();

  /// Logs the user out
  Future<void> logOut();
}
