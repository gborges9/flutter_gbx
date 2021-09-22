import 'package:dartz/dartz.dart';
import 'package:gbx_auth/src/domain/repositories/auth_repository.dart';
import 'package:gbx_core/gbx_core.dart';

class SignOut extends IUseCase<void, NoParams> {
  final IAuthRepository _repository;

  const SignOut(this._repository);

  @override
  Future<Either<IFailure, void>> call([NoParams params = const NoParams()]) {
    return _repository.logOut();
  }
}
