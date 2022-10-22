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
    return state is LoadedRemoteDataState<T>;
  }

  /// Handles the [LoadMoreRemoteData] event.
  Future<void> handleLoadMoreData(
    E event,
    Emitter<RemoteDataState<T>> emit,
  ) async {
    final initialData = state.dataOrNull();
    assert(initialData != null, "Can't load more data without initial data!");
    emit(LoadingRemoteDataState(
        data: initialData, loadingType: LoadingType.loadingMore));
    try {
      final data = await loadMoreData(event, initialData!);
      emit(LoadedRemoteDataState(data: data, firstTimeLoaded: false));
    } catch (e, trace) {
      emit(
        ErrorRemoteDataState(
          data: initialData,
          error: e,
          stackTrace: trace,
          loadingType: LoadingType.loadingMore,
          temporary: true,
        ),
      );
      emit(LoadedRemoteDataState(data: initialData!));
    }
  }

  /// Load the data and return the resulting list
  Future<T> loadMoreData(E event, T oldList);
}

class LoadMoreRemoteData extends RemoteDataEvent {
  const LoadMoreRemoteData();
}
