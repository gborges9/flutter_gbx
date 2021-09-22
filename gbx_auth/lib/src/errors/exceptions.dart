class AuthException implements Exception {}

class UserNotLoggedInException extends AuthException {}

class ChangePasswordException extends AuthException {}

class InvalidResetCodeException implements Exception {}

class ResetPasswordException implements Exception {}

class NoCachedUserException implements Exception {}
