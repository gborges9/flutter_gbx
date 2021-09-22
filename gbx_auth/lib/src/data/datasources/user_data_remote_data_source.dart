import 'package:gbx_auth/src/data/models/gbx_user_serializer.dart';
import 'package:gbx_auth/src/domain/entities/gbx_user.dart';

abstract class UserDataRemoteDataSource<T extends GbxUser> {
  final IGbxUserSerializer<T> serializer;

  const UserDataRemoteDataSource(this.serializer);

  /// Gets the [UserModel] from the database.
  ///
  /// Throws [UserNotLoggedInException] if the user is not logged in.
  /// Throws [IncompleteDataException] if the user data is incomplete.
  /// Throws [MissingDataException] if there is no data available.
  Future<T> getUserData(String uid);

  /// Updates the current [User]
  ///
  /// Throws [UserNotLoggedInException] if the user is not logged in.
  Future<void> updateUserData(String uid, T user);
}
