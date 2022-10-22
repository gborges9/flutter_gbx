import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gbx_bloc/src/blocs/bloc_helpers.dart';
import 'package:gbx_bloc/src/blocs/bloc_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_event.dart';
part 'data_state.dart';
part 'data_bloc.freezed.dart';
part 'base_data_bloc.dart';

abstract class DataBloc<T> extends BaseDataBloc<DataEvent, T> {
  DataBloc({T? initialData}) : super(initialData: initialData);

  @override
  void declareWorkflows() {
    registerWorkflow<InitializeData>(
      job: fetchData,
      canRun: canInitialize,
      loadingType: LoadingType.initializing,
      onSuccess: (event, data, emit) =>
          emit(LoadedDataState(data: data, firstTimeLoaded: true)),
      autoRecoverFromError: autoRecoverFromInitializationError,
    );
  }

  bool canInitialize(InitializeData event, DataState<T> state) {
    return state is UninitializedDataState || state is ErrorDataState;
  }

  Future<void> handleInitializeData(
    InitializeData event,
    Emitter<DataState<T>> emit,
  ) async {
    try {
      final data = await runWithLoading(
          emit: emit,
          loadingType: LoadingType.initializing,
          runnable: () => fetchData(event));
      emit(LoadedDataState(data: data, firstTimeLoaded: true));
    } catch (e, trace) {
      emit(ErrorDataState(
          error: e, stackTrace: trace, loadingType: LoadingType.initializing));
    }
  }

  /// Fetches the data for the Bloc
  FutureOr<T> fetchData(DataEvent event);

  bool get autoRecoverFromInitializationError => false;
}
