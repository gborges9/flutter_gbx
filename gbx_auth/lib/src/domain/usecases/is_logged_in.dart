import 'package:dartz/dartz.dart';
import 'package:gbx_auth/src/domain/repositories/auth_repository.dart';
import 'package:gbx_core/gbx_core.dart';

class IsLoggedIn extends IUseCase<String, NoParams> {
  final IAuthRepository _repository;

  const IsLoggedIn(this._repository);

  @override
  Future<Either<IFailure, String>> call([NoParams params = const NoParams()]) {
    return _repository.isLoggedIn();
  }
}
