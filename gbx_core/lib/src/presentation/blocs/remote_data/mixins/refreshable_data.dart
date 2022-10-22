import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbx_core/src/domain/bloc/bloc_state.dart';

import '../remote_data_bloc.dart';

/// A Mixin for refreshable [RemoteDataBloc]s.
///
/// Use it if you need to refresh the data of your bloc.
mixin RefreshableData<T, E extends RefreshRemoteData> on RemoteDataBloc<T> {
  @override
  void declareEvents() {
    super.declareEvents();
    conditionalOn<E>(
      handler: handleRefreshData,
      conditional: canRefresh,
    );
  }

  /// Defines if the event will be handled or discarted.
  /// By default, it will only be handled if the current state is [RemoteDataLoaded].
  bool canRefresh(E event, RemoteDataState<T> state) {
    return state is LoadedRemoteDataState<T>;
  }

  /// Handles the [RefreshRemoteData] event.
  Future<void> handleRefreshData(
    E event,
    Emitter<RemoteDataState<T>> emit,
  ) async {
    emit(LoadingRemoteDataState(
      data: state.dataOrNull(),
      loadingType: LoadingType.refreshing,
    ));
    try {
      final data = await fetchData(event);
      emit(LoadedRemoteDataState(data: data));
    } catch (e, trace) {
      emit(
        ErrorRemoteDataState(
            data: state.dataOrNull(),
            error: e,
            stackTrace: trace,
            loadingType: LoadingType.refreshing),
      );
    }
  }
}

class RefreshRemoteData extends RemoteDataEvent {
  const RefreshRemoteData();
}
