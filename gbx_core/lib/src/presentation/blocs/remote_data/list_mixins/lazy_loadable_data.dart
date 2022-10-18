import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/bloc/bloc_state.dart';
import '../remote_data_bloc.dart';

/// A Mixin for lazy loading [RemoteDataBloc]s.
///
/// Use it if you need to load more data over time in your bloc.
mixin LazyLoadable<T extends Iterable, E extends LoadMoreRemoteData>
    on RemoteDataBloc<T> {
  @override
  void declareEvents() {
    super.declareEvents();
    conditionalOn<E>(
      handler: handleLoadMoreData,
      conditional: canLoadMore,
    );
  }

  /// Defines if the event will be handled or discarted.
  ///
  /// By default, it will only be handled if the current state is [RemoteDataLoaded].
  bool canLoadMore(E event, RemoteDataState<T> state) {
    return state is RemoteDataLoaded<T>;
  }

  /// Handles the [LoadMoreRemoteData] event.
  Future<void> handleLoadMoreData(
    E event,
    Emitter<RemoteDataState<T>> emit,
  ) async {
    final state = this.state as InitializedRemoteDataState<T>;
    emit(getLoadingMoreState(event, state.data));
    try {
      final data = await loadMoreData(event, state.data);
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

  /// Load the data and return the resulting list
  Future<T> loadMoreData(E event, T oldList);

  RemoteDataLoadingMore<T> getLoadingMoreState(E event, T data) =>
      RemoteDataLoadingMore(data);
}

class LoadMoreRemoteData extends RemoteDataEvent {
  const LoadMoreRemoteData();
}

class RemoteDataLoadingMore<T> extends InitializedRemoteDataState<T>
    implements LoadingState {
  RemoteDataLoadingMore(super.data);
}
