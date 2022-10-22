import 'dart:async';

import '../../bloc_state.dart';
import '../data_bloc.dart';

/// A Mixin for lazy loading [DataBloc]s.
///
/// Use it if you need to load more data over time in your bloc.
mixin LazyLoadable<E extends LoadMoreData, T extends Iterable> on DataBloc<T> {
  @override
  void declareWorkflows() {
    super.declareWorkflows();
    registerWorkflow<E>(
      job: (event) => loadMoreData(event, state.dataOrNull()!),
      canRun: canLoadMore,
      autoRecoverFromError: true,
      loadingType: LoadingType.loadingMore,
    );
  }

  /// Defines if the event will be handled or discarted.
  ///
  /// By default, it will only be handled if the current state is [DataLoaded].
  bool canLoadMore(E event, DataState<T> state) {
    return state is LoadedDataState<T>;
  }

  /// Load the data and return the resulting list
  FutureOr<T> loadMoreData(E event, T oldList);
}

class LoadMoreData extends DataEvent {
  const LoadMoreData();
}
