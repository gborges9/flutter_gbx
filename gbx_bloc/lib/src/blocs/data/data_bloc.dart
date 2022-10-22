import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gbx_bloc/src/blocs/bloc_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../bloc_helpers.dart';

part 'data_event.dart';
part 'data_state.dart';
part 'data_bloc.freezed.dart';

abstract class DataBloc<T> extends Bloc<DataEvent, DataState<T>>
    with BlocHelper {
  final bool alwaysEmitLoading;

  DataBloc({T? initialData, this.alwaysEmitLoading = false})
      : super(initialData != null
            ? DataState.loaded(data: initialData, firstTimeLoaded: true)
            : const DataState.uninitialized()) {
    declareEvents();
  }

  void declareEvents() {
    conditionalOn<InitializeData>(
      handler: handleInitializeData,
      conditional: canInitialize,
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

  /// Runs a task (usually a data operation).
  ///
  /// This will automatically emit a [LoadingDataState] if the runnable returns a future or if [alwaysEmitLoading] is true.
  @protected
  FutureOr<V> runWithLoading<V>({
    required FutureOr<V> Function() runnable,
    required LoadingType loadingType,
    required Emitter<DataState<T>> emit,
    T? loadingData,
  }) async {
    final futureOrData = runnable();
    if (!alwaysEmitLoading && futureOrData is! Future) {
      return futureOrData;
    }

    emit(
      LoadingDataState(
          data: loadingData ?? state.dataOrNull(), loadingType: loadingType),
    );
    return await futureOrData;
  }
}
