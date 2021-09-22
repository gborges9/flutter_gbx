import 'package:dartz/dartz.dart';
import 'package:gbx_auth/src/domain/repositories/auth_repository.dart';
import 'package:gbx_core/gbx_core.dart';

class BackgroundLogin extends IUseCase<bool, NoParams> {
  final IAuthRepository repository;

  const BackgroundLogin(this.repository);

  @override
  Future<Either<IFailure, bool>> call([NoParams params = const NoParams()]) =>
      repository.backgroundLogin();
}
