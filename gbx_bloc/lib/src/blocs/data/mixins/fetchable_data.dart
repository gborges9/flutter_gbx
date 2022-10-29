import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../bloc_state.dart';
import '../data_bloc.dart';

/// A Mixin for [DataBloc]s where you can set the data.
///
/// Use it if you need to set the data of your bloc.
mixin FetchableData<E extends FetchData, T> on DataBloc<T> {
  @override
  void declareWorkflows() {
    super.declareWorkflows();
    registerWorkflow<E>(
      job: fetchData,
      canRun: canFetch,
      loadingType: LoadingType.fetching,
      onSuccess: (event, data, emit) =>
          emit(LoadedDataState(data: data, firstTimeLoaded: true)),
      autoRecoverFromError: autoRecoverFromFetchError,
      loadingStateBuilder: buildFetchDataLoadingState,
      transformer: fetchDataTransformer,
    );
  }

  @protected
  bool canFetch(E event, DataState<T> state) {
    return state is UninitializedDataState || state is ErrorDataState;
  }

  /// Fetches the data for the Bloc
  @protected
  FutureOr<T> fetchData(E event, DataState<T> initialState);

  @protected
  bool get autoRecoverFromFetchError => false;

  @protected
  EventTransformer<E>? get fetchDataTransformer => null;

  @protected
  LoadingDataState<T> buildFetchDataLoadingState(
          DataState<T> initialState, LoadingType loadingType) =>
      LoadingDataState(data: null, loadingType: LoadingType.fetching);
}

class FetchData extends DataEvent {
  const FetchData();
}
