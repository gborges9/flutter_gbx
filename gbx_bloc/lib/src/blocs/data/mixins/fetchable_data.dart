import 'dart:async';
import '../../bloc_state.dart';
import '../data_bloc.dart';

/// A Mixin for [DataBloc]s where you can set the data.
///
/// Use it if you need to set the data of your bloc.
mixin FetchableData<E extends FetchData, T> on DataBloc<T> {
  @override
  void declareWorkflows() {
    registerWorkflow<E>(
      job: fetchData,
      canRun: canFetch,
      loadingType: LoadingType.fetching,
      onSuccess: (event, data, emit) =>
          emit(LoadedDataState(data: data, firstTimeLoaded: true)),
      autoRecoverFromError: autoRecoverFromFetchError,
    );
  }

  bool canFetch(E event, DataState<T> state) {
    return state is UninitializedDataState || state is ErrorDataState;
  }

  /// Fetches the data for the Bloc
  FutureOr<T> fetchData(E event, DataState<T> initialState);

  bool get autoRecoverFromFetchError => false;
}

class FetchData extends DataEvent {
  const FetchData();
}
