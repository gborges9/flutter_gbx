import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc_state.dart';
import '../data_bloc.dart';

/// A Mixin for refreshable [DataBloc]s.
///
/// Use it if you need to refresh the data of your bloc.
mixin RefreshableData<T, E extends RefreshData> on DataBloc<T> {
  @override
  void declareEvents() {
    super.declareEvents();
    conditionalOn<E>(
      handler: handleRefreshData,
      conditional: canRefresh,
    );
  }

  /// Defines if the event will be handled or discarted.
  /// By default, it will only be handled if the current state is [DataLoaded].
  bool canRefresh(E event, DataState<T> state) {
    return state is LoadedDataState<T>;
  }

  /// Handles the [RefreshData] event.
  Future<void> handleRefreshData(
    E event,
    Emitter<DataState<T>> emit,
  ) async {
    try {
      final data = await runWithLoading(
          runnable: () => fetchData(event),
          loadingType: LoadingType.refreshing,
          emit: emit);
      emit(LoadedDataState(data: data));
    } catch (e, trace) {
      emit(
        ErrorDataState(
            data: state.dataOrNull(),
            error: e,
            stackTrace: trace,
            loadingType: LoadingType.refreshing),
      );
    }
  }

  bool get autoRecoverFromRefreshError => false;
}

class RefreshData extends DataEvent {
  const RefreshData();
}
