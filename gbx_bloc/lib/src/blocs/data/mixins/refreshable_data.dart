import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc_state.dart';
import '../data_bloc.dart';

/// A Mixin for refreshable [DataBloc]s.
///
/// Use it if you need to refresh the data of your bloc.
mixin RefreshableData<E extends RefreshData, T> on DataBloc<T> {
  @override
  void declareWorkflows() {
    super.declareWorkflows();
    registerWorkflow<E>(
      job: fetchData,
      canRun: canRefresh,
      autoRecoverFromError: autoRecoverFromRefreshError,
      loadingType: LoadingType.refreshing,
    );
  }

  /// Defines if the event will be handled or discarted.
  /// By default, it will only be handled if the current state is [DataLoaded].
  bool canRefresh(E event, DataState<T> state) {
    return state is LoadedDataState<T>;
  }

  bool get autoRecoverFromRefreshError => true;
}

class RefreshData extends DataEvent {
  const RefreshData();
}
