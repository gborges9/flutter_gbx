import 'package:gbx_auth/src/domain/entities/gbx_user.dart';
import 'package:gbx_auth/src/domain/repositories/auth_repository.dart';
import 'package:gbx_core/gbx_core.dart';

class LogIn<T extends GbxUser> extends IUseCase<T, LogInParams> {
  final IAuthRepository<T> repository;

  const LogIn(this.repository);

  @override
  Future<Either<IFailure, T>> call(LogInParams params) async {
    return await repository.logInWithEmail(params.email, params.password);
  }
}

class LogInParams {
  final String email;
  final String password;

  LogInParams(
    this.email,
    this.password,
  );
}
