import 'dart:async';

import 'package:gbx_core/src/domain/repository/types.dart';
import 'package:gbx_core/src/core/exceptions/failures.dart';

class Repository {
  final Map<Type, Failure Function(dynamic exception, StackTrace stackTrace)>
      exceptionHandlers = {};

  FutureOr<Result<T>> executeCatching<T>(FutureOr<T> Function() execute) async {
    try {
      return ResultSuccess(await execute());
    } catch (e, stackTrace) {
      return ResultError(_handleErrorOrThrow(e, stackTrace));
    }
  }

  Failure _handleErrorOrThrow(e, StackTrace trace) {
    final func = exceptionHandlers[e.runtimeType];
    if (func != null) {
      return func(e, trace);
    }
    throw e;
  }

  void on<E>(Failure Function(E e, StackTrace trace) handler) {
    exceptionHandlers[E] =
        (exception, stackTrace) => handler(exception as E, stackTrace);
  }
}
