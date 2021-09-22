import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import './failure_extensions.dart';
import '../interfaces/failure.dart';

extension EitherGetter<L, R> on Either<L, R> {
  R get right => (this as Right<L, R>).value;
  L get left => (this as Left<L, R>).value;
}

extension EitherFailure<R> on Either<IFailure, R> {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showError({
    FailureWidgetBuilder? builder,
    Duration duration = const Duration(seconds: 5),
    MessageBuilder? messageBuilder,
  }) {
    return this.left.snackbar(
        builder: builder, duration: duration, messageBuilder: messageBuilder);
  }
}
