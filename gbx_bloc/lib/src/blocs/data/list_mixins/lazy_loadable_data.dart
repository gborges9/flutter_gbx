import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

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
      job: loadMoreData,
      canRun: canLoadMore,
      autoRecoverFromError: true,
      loadingType: LoadingType.loadingMore,
      transformer: loadMoreDataTransformer,
    );
  }

  /// Defines if the event will be handled or discarted.
  ///
  /// By default, it will only be handled if the current state is [DataLoaded].
  bool canLoadMore(E event, DataState<T> state) {
    return state is LoadedDataState<T>;
  }

  /// Load the data and return the resulting list
  FutureOr<T> loadMoreData(E event, DataState<T> oldList);

  @protected
  EventTransformer<E>? get loadMoreDataTransformer => null;
}

class LoadMoreData extends DataEvent {
  const LoadMoreData();
}
