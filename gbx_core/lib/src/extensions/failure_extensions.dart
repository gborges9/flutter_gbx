import 'package:flutter/material.dart';
import 'package:gbx_core/gbx_core.dart';
import 'package:gbx_core/src/interfaces/failure.dart';

typedef FailureWidgetBuilder = Widget Function(BuildContext ctx, IFailure f);
typedef MessageBuilder = String Function(IFailure f);

extension FailureDisplay on IFailure {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackbar({
    FailureWidgetBuilder? builder,
    Duration duration = const Duration(seconds: 5),
    MessageBuilder? messageBuilder,
  }) {
    var v = ScaffoldMessenger.of(Gbx.context!).showSnackBar(SnackBar(
      content: builder?.call(Gbx.context!, this) ??
          Text(messageBuilder?.call(this) ?? "ERROR: $message"),
      duration: duration,
    ));
    return v;
  }
}
