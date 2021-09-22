import '../interfaces/failure.dart';

class CacheFailure extends IFailure {}

class IncompleteDataFailure extends IFailure {}

class MissingDataFailure extends IFailure {}

class UnhandledException extends IFailure {
  final Exception e;

  const UnhandledException(this.e);
}
