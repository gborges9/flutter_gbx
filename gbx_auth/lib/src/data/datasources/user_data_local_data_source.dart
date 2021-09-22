import 'package:gbx_auth/src/data/models/user_model.dart';

abstract class UserDataLocalDataSource {
  /// Gets the cached [UserModel].
  ///
  /// Throws [CacheException] if any errors occur in the cache.
  /// Throws [MissingDataException] if no cached data is present.
  /// Throws [IncompleteDataException] if the data present is incomplete
  Future<UserModel> getCachedUser(String uid);
}
