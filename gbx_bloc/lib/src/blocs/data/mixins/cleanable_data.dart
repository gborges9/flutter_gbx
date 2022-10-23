import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbx_bloc/gbx_bloc.dart';

/// A Mixin for cleanable [DataBloc]s.
///
/// Use it if you need to clean the data of your bloc.
mixin CleanableData<E extends CleanData, T> on DataBloc<T> {
  @override
  void declareWorkflows() {
    super.declareWorkflows();
    registerWorkflow<E>(
      job: (_, __) => throw Exception("No data to return"),
      canRun: canClean,
      loadingType: LoadingType.cleaning,
      onError: (_, __, ___, ____, _____, ______, emit) =>
          emit(const UninitializedDataState()),
    );
  }

  /// Defines if the event will be handled or discarted.
  /// By default, it will only be handled if the current state is [LoadedDataState].
  bool canClean(E event, DataState<T> state) {
    return state is LoadedDataState<T>;
  }

  /// Handles the [CleanData] event.
  ///
  /// By default, this will only emit the [UninitializedDataState] state.
  Future<void> handleCleanData(
    E event,
    Emitter<DataState<T>> emit,
  ) async {
    emit(const UninitializedDataState());
  }
}

class CleanData extends DataEvent {
  const CleanData();
}
