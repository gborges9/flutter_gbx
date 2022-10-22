import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc_state.dart';
import '../data_bloc.dart';

/// A Mixin for lazy loading [DataBloc]s.
///
/// Use it if you need to load more data over time in your bloc.
mixin LazyLoadable<T extends Iterable, E extends LoadMoreData> on DataBloc<T> {
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
  /// By default, it will only be handled if the current state is [DataLoaded].
  bool canLoadMore(E event, DataState<T> state) {
    return state is LoadedDataState<T>;
  }

  /// Handles the [LoadMoreData] event.
  Future<void> handleLoadMoreData(
    E event,
    Emitter<DataState<T>> emit,
  ) async {
    final initialData = state.dataOrNull();
    assert(initialData != null, "Can't load more data without initial data!");
    try {
      final data = await runWithLoading(
          runnable: () => loadMoreData(event, initialData!),
          loadingType: LoadingType.loadingMore,
          emit: emit,
          loadingData: initialData);
      emit(LoadedDataState(data: data, firstTimeLoaded: false));
    } catch (e, trace) {
      emit(
        ErrorDataState(
          data: initialData,
          error: e,
          stackTrace: trace,
          loadingType: LoadingType.loadingMore,
          temporary: true,
        ),
      );
      emit(LoadedDataState(data: initialData!));
    }
  }

  /// Load the data and return the resulting list
  FutureOr<T> loadMoreData(E event, T oldList);
}

class LoadMoreData extends DataEvent {
  const LoadMoreData();
}
