import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:gbx_auth/src/domain/entities/gbx_user.dart';
import 'package:gbx_auth/src/domain/repositories/auth_repository.dart';
import 'package:gbx_core/gbx_core.dart';

class SignUp<T extends GbxUser> extends IUseCase<T, SignUpParams<T>> {
  final IAuthRepository<T> repository;

  const SignUp(this.repository);

  @override
  Future<Either<IFailure, T>> call(SignUpParams<T> params) async {
    return await repository.signUpWithEmail(params.user, params.password);
  }
}

class SignUpParams<T extends GbxUser> extends Equatable {
  final T user;
  final String password;

  const SignUpParams({required this.user, required this.password});

  @override
  List<Object> get props => [user, password];
}
