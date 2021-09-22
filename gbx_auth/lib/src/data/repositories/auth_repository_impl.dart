import 'package:farm_app/core/error/exceptions.dart';

import 'package:dartz/dartz.dart';
import 'package:farm_app/features/auth/data/datasources/user_data_local_data_source.dart';
import 'package:farm_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:farm_app/features/auth/data/datasources/user_data_remote_data_source.dart';
import 'package:farm_app/features/auth/data/models/user_model.dart';
import 'package:farm_app/features/auth/domain/entities/user.dart';

import 'package:firebase_core/firebase_core.dart';

class IAuthRepositoryImpl extends IAuthRepository {
  final AuthRemoteDataSource _authDataSource;
  final UserDataRemoteDataSource _remoteDataSource;
  final UserDataLocalDataSource _localDataSource;

  IAuthRepositoryImpl(
      {required AuthRemoteDataSource authDataSource,
      required UserDataLocalDataSource localDataSource,
      required UserDataRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource,
        _authDataSource = authDataSource;

  Future<Either<Failure, T>> execute<T>(Future<T> Function() func) async {
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
    } on FirebaseException catch (e) {
      print("ERROR: ${e.code} - ${e.message}");
      return Left(FirebaseFailure(e));
    }
  }

  @override
  Future<Either<Failure, User>> getCurrentUser(bool forceRefresh) =>
      execute(() async {
        var fbUser = await _authDataSource.getUser();
        if (!forceRefresh)
          return await _cachedOrServerUserData(fbUser.uid);
        else
          return await _remoteDataSource.getUserData(fbUser.uid);
      });

  @override
  Future<Either<Failure, User>> logInWithEmail(String email, String password) =>
      execute(() async {
        var fbUser = await _authDataSource.logInWithEmail(email, password);
        return await _remoteDataSource.getUserData(fbUser.uid);
      });

  @override
  Future<Either<Failure, User>> signUpWithEmail(User user, String password) =>
      execute(() async {
        print("Trying to sign up\nemail: ${user.email}\npassword: $password");
        var fbUser =
            await _authDataSource.signUpWithEmail(user.email, password);
        await _remoteDataSource.updateUserData(
            fbUser.uid, UserModel.from(user));

        return await _cachedOrServerUserData(fbUser.uid);
      });

  @override
  Future<Either<Failure, User>> updateUser(User newUser) => execute(() async {
        var fbUser = await _authDataSource.getUser();
        await _remoteDataSource.updateUserData(
            fbUser.uid, UserModel.from(newUser));
        return await _localDataSource.getCachedUser(fbUser.uid);
      });

  @override
  Future<Either<Failure, void>> resetPasswordRequest(String email) =>
      execute(() => _authDataSource.changePasswordRequest(email));

  @override
  Future<Either<Failure, String>> resetPasswordVerifyCode(String code) =>
      execute(() => _authDataSource.verifyPasswordResetCode(code));

  @override
  Future<Either<Failure, void>> resetPasswordConfirm(
          String code, String newPassword) =>
      execute(() => _authDataSource.changePassword(code, newPassword));

  Future<User> _cachedOrServerUserData(String uid) async {
    try {
      return await _localDataSource.getCachedUser(uid);
    } catch (e) {
      print("USER NOT AVAILABLE IN CACHE: $e");
      return await _remoteDataSource.getUserData(uid);
    }
  }

  @override
  Future<Either<Failure, bool>> backgroundLogin() => execute(() async {
        await _authDataSource.backgroundLogin();
        return true;
      });

  @override
  Future<Either<Failure, String>> isLoggedIn() => execute(() async {
        return (await _authDataSource.getUser()).uid;
      });

  @override
  Future<Either<Failure, void>> logOut() => execute(() async {
        return this._authDataSource.logOut();
      });
}
