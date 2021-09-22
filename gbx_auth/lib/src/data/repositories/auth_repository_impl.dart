import 'package:dartz/dartz.dart';
import 'package:gbx_auth/src/data/datasources/auth_remote_data_source.dart';
import 'package:gbx_auth/src/data/datasources/user_data_local_data_source.dart';
import 'package:gbx_auth/src/data/datasources/user_data_remote_data_source.dart';
import 'package:gbx_auth/src/domain/entities/gbx_user.dart';
import 'package:gbx_auth/src/domain/repositories/auth_repository.dart';
import 'package:gbx_auth/src/errors/exceptions.dart';
import 'package:gbx_auth/src/errors/failures.dart';
import 'package:gbx_core/gbx_core.dart';

class IAuthRepositoryImpl<T extends GbxUser> extends IAuthRepository<T> {
  final AuthRemoteDataSource _authDataSource;
  final UserDataRemoteDataSource<T> _remoteDataSource;
  final UserDataLocalDataSource<T> _localDataSource;

  IAuthRepositoryImpl({
    required AuthRemoteDataSource authDataSource,
    required UserDataLocalDataSource<T> localDataSource,
    required UserDataRemoteDataSource<T> remoteDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource,
        _authDataSource = authDataSource;

  Future<Either<IFailure, N>> execute<N>(Future<N> Function() func) async {
    try {
      var response = await func();
      return Right(response);
    } on AuthException {
      return Left(AuthFailure());
    } on CacheException {
      return Left(CacheFailure());
    } on IncompleteDataException {
      return Left(IncompleteDataFailure());
    } on MissingDataException {
      return Left(MissingDataFailure());
    } on Exception catch (e) {
      return Left(UnhandledException(e));
    }
  }

  @override
  Future<Either<IFailure, T>> getCurrentUser(bool forceRefresh) =>
      execute(() async {
        var uid = await _authDataSource.getUser();
        if (!forceRefresh) {
          return await _cachedOrServerUserData(uid);
        } else {
          return await _remoteDataSource.getUserData(uid);
        }
      });

  @override
  Future<Either<IFailure, T>> logInWithEmail(String email, String password) =>
      execute(() async {
        var uid = await _authDataSource.logInWithEmail(email, password);
        return await _remoteDataSource.getUserData(uid);
      });

  @override
  Future<Either<IFailure, T>> signUpWithEmail(T user, String password) =>
      execute(() async {
        var uid = await _authDataSource.signUpWithEmail(user.email, password);
        await _remoteDataSource.updateUserData(uid, user);

        return await _cachedOrServerUserData(uid);
      });

  @override
  Future<Either<IFailure, T>> updateUser(T newUser) => execute(() async {
        var uid = await _authDataSource.getUser();
        await _remoteDataSource.updateUserData(uid, newUser);
        return await _localDataSource.getCachedUser(uid);
      });

  @override
  Future<Either<IFailure, void>> resetPasswordRequest(String email) =>
      execute(() => _authDataSource.changePasswordRequest(email));

  @override
  Future<Either<IFailure, String>> resetPasswordVerifyCode(String code) =>
      execute(() => _authDataSource.verifyPasswordResetCode(code));

  @override
  Future<Either<IFailure, void>> resetPasswordConfirm(
          String code, String newPassword) =>
      execute(() => _authDataSource.changePassword(code, newPassword));

  Future<T> _cachedOrServerUserData(String uid) async {
    try {
      return await _localDataSource.getCachedUser(uid);
    } catch (e) {
      return await _remoteDataSource.getUserData(uid);
    }
  }

  @override
  Future<Either<IFailure, bool>> backgroundLogin() => execute(() async {
        await _authDataSource.backgroundLogin();
        return true;
      });

  @override
  Future<Either<IFailure, String>> isLoggedIn() => execute(() async {
        return (await _authDataSource.getUser());
      });

  @override
  Future<Either<IFailure, void>> logOut() => execute(() async {
        return _authDataSource.logOut();
      });
}
