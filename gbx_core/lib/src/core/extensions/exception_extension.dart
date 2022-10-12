import 'package:gbx_core/src/core/exceptions/failures.dart';

extension ExceptionExt on Exception {
  Failure toFailure(Type origin, [StackTrace? stackTrace]) {
    return Failure(origin: origin, error: this, trace: stackTrace);
  }
}
