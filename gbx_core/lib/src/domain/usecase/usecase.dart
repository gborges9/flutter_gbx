import 'base.dart';

abstract class UseCase<Type, Param> extends BaseUseCase<Future<Type>, Param> {
  const UseCase();
}
