import 'package:dartz/dartz.dart';
import 'package:gbx_auth/src/domain/entities/gbx_user.dart';
import 'package:gbx_auth/src/domain/repositories/auth_repository.dart';
import 'package:gbx_core/gbx_core.dart';

class GetCurrentUser<T extends GbxUser> extends IUseCase<T, bool> {
  final IAuthRepository<T> repository;

  const GetCurrentUser(this.repository);

  @override
  Future<Either<IFailure, T>> call([bool forceRefresh = false]) async {
    return await repository.getCurrentUser(forceRefresh);
  }
}
