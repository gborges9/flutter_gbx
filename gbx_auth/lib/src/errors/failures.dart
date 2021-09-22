import 'package:gbx_core/gbx_core.dart';

class AuthFailure extends IFailure {}

class UserNotLoggedInFailure extends IFailure {}

class ChangePasswordFailure extends IFailure {}

class InvalidResetCodeFailure extends IFailure {}

class ResetPasswordFailure extends IFailure {}

class NoCachedUserFailure extends IFailure {}
