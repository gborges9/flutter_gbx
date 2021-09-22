import 'package:dartz/dartz.dart';
import 'package:gbx_auth/src/domain/entities/gbx_user.dart';
import 'package:gbx_core/gbx_core.dart';

abstract class IAuthRepository<T extends GbxUser> {
  Future<Either<IFailure, String>> isLoggedIn();
  Future<Either<IFailure, T>> getCurrentUser(bool forceRefresh);
  Future<Either<IFailure, T>> logInWithEmail(String email, String password);
  Future<Either<IFailure, T>> signUpWithEmail(T user, String password);
  Future<Either<IFailure, T>> updateUser(T newUser);
  Future<Either<IFailure, bool>> backgroundLogin();

  Future<Either<IFailure, void>> logOut();

  Future<Either<IFailure, void>> resetPasswordRequest(String email);
  Future<Either<IFailure, String>> resetPasswordVerifyCode(String code);
  Future<Either<IFailure, void>> resetPasswordConfirm(
      String code, String newPassword);
}
