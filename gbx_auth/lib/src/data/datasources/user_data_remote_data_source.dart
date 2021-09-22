import 'package:gbx_auth/src/data/models/user_model.dart';

abstract class UserDataRemoteDataSource {
  /// Gets the [UserModel] from the database.
  ///
  /// Throws [UserNotLoggedInException] if the user is not logged in.
  /// Throws [IncompleteDataException] if the user data is incomplete.
  /// Throws [MissingDataException] if there is no data available.
  Future<UserModel> getUserData(String uid);

  /// Updates the current [User]
  ///
  /// Throws [UserNotLoggedInException] if the user is not logged in.
  Future<void> updateUserData(String uid, UserModel user);
}
