import 'package:gbx_auth/src/data/models/gbx_user_serializer.dart';
import 'package:gbx_auth/src/domain/entities/gbx_user.dart';

abstract class UserDataLocalDataSource<T extends GbxUser> {
  final IGbxUserSerializer<T> serializer;

  const UserDataLocalDataSource(this.serializer);

  /// Gets the cached [UserModel].
  ///
  /// Throws [CacheException] if any errors occur in the cache.
  /// Throws [MissingDataException] if no cached data is present.
  /// Throws [IncompleteDataException] if the data present is incomplete
  Future<T> getCachedUser(String uid);
}
