import 'package:dartz/dartz.dart';
import 'package:gbx_auth/src/domain/entities/gbx_user.dart';
import 'package:gbx_auth/src/domain/repositories/auth_repository.dart';
import 'package:gbx_core/gbx_core.dart';

class UpdateUser<T extends GbxUser> extends IUseCase<T, UpdateUserParams<T>> {
  final IAuthRepository<T> repository;

  const UpdateUser(this.repository);

  @override
  Future<Either<IFailure, T>> call(UpdateUserParams<T> params) async {
    return await repository.updateUser(params.user);
  }
}

class UpdateUserParams<T extends GbxUser> {
  final T user;

  const UpdateUserParams(this.user);
}
