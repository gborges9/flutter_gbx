import 'base.dart';

abstract class StreamUseCase<Type, Param>
    extends BaseUseCase<Stream<Type>, Param> {
  const StreamUseCase();
}
