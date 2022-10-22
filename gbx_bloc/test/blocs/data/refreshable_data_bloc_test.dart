import 'dart:async';

import 'package:gbx_bloc/gbx_bloc.dart';

class FakeSyncRefreshableDataBloc extends DataBloc with RefreshableData {
  bool throwError;
  bool autoRecover;
  dynamic next;

  FakeSyncRefreshableDataBloc(
      {this.throwError = false, this.autoRecover = false});

  @override
  FutureOr fetchData(DataEvent event) {
    return next ?? 0;
  }

  @override
  bool get autoRecoverFromRefreshError => autoRecover;
}

void main() {
  // TODO:
}
