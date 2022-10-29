import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc_state.dart';
import '../data_bloc.dart';

/// A Mixin for [DataBloc]s with appendable data.
///
/// Use it if you need to append more data over time in your bloc.
mixin AppendableData<E extends AppendData, T extends Iterable> on DataBloc<T> {
  @override
  void declareWorkflows() {
    super.declareWorkflows();
    conditionalOn<E>(
      handler: handleAppendData,
      conditional: canAppend,
      transformer: appendDataTransformer,
    );
  }

  /// Defines if the event will be handled or discarted.
  ///
  /// By default, it will only be handled if the current state is [DataLoaded].
  bool canAppend(E event, DataState<T> state) {
    return state is LoadedDataState<T>;
  }

  /// Handles the [AppendData] event.
  Future<void> handleAppendData(
    E event,
    Emitter<DataState<T>> emit,
  ) async {
    final initialData = state.dataOrNull()!;
    try {
      final data = await runWithLoading(
        runnable: () => appendData(event, initialData),
        loadingType: LoadingType.appending,
        emit: emit,
      );
      emit(LoadedDataState(data: data));
    } catch (e, trace) {
      emit(
        ErrorDataState(
            data: state.dataOrNull(),
            error: e,
            stackTrace: trace,
            loadingType: LoadingType.appending,
            temporary: true),
      );
      emit(LoadedDataState(data: initialData));
    }
  }

  /// Append the data and return the resulting list
  FutureOr<T> appendData(E event, T oldList);

  @protected
  EventTransformer<E>? get appendDataTransformer => null;
}

class AppendData<T> extends DataEvent {
  const AppendData({required this.newItems});

  final T newItems;
}
