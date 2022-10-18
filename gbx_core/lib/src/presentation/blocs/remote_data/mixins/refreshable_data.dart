import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/bloc/bloc_state.dart';
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
    return state is RemoteDataLoaded<T>;
  }

  /// Handles the [RefreshRemoteData] event.
  Future<void> handleRefreshData(
    E event,
    Emitter<RemoteDataState<T>> emit,
  ) async {
    final state = this.state as InitializedRemoteDataState<T>;
    emit(getRefreshingState(event, state.data));
    try {
      final data = await fetchData(event);
      emit(getLoadingTemporarySuccessState(event, data));
      emit(getLoadedState(event, data));
    } catch (e, trace) {
      emit(getLoadingTemporaryFailState(
        event,
        state.data,
        error: e,
        trace: trace,
      ));
      emit(getLoadedState(event, state.data));
    }
  }

  RemoteDataRefreshing<T> getRefreshingState(E event, T data) =>
      RemoteDataRefreshing(data);
}

class RefreshRemoteData extends RemoteDataEvent {
  const RefreshRemoteData();
}

class RemoteDataRefreshing<T> extends InitializedRemoteDataState<T>
    implements LoadingState {
  RemoteDataRefreshing(super.data);
}
