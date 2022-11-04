import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:gbx_bloc/gbx_bloc.dart';

class DataAction<Event extends DataEvent, T>
    extends EventAction<Event, DataState<T>> {
  final bool alwaysEmitLoading;
  final LoadingType loadingType;
  final CanAct<Event, T>? _canAct;
  final ErrorHandler<Event, T>? _errorHandler;
  final LoadingGetter<Event, T>? _loadingGetter;
  final bool autoRecoverFromError;
  final FutureOr<T> Function(Event event, DataState<T> initialState) _act;

  DataAction({
    required FutureOr<T> Function(Event event, DataState<T> initialState) act,
    this.autoRecoverFromError = false,
    this.alwaysEmitLoading = false,
    required this.loadingType,
    CanAct<Event, T>? canAct,
    ErrorHandler<Event, T>? errorHandler,
    LoadingGetter<Event, T>? getLoadingState,
  })  : _act = act,
        _canAct = canAct,
        _errorHandler = errorHandler,
        _loadingGetter = getLoadingState;

  @override
  bool canAct(event, initialState) => _canAct != null
      ? _canAct!(event, initialState)
      : initialState is! LoadingDataState;

  @override
  EventTransformer<Event>? get transformer => null;

  @override
  FutureOr<void> act(Event event, DataState<T> initialState,
      Emitter<DataState<T>> emit) async {
    try {
      T data = await runWithLoading(event, initialState, emit);
      emit(LoadedDataState(data: data));
    } catch (e, stackTrace) {
      await handleActError(
        event: event,
        initialState: initialState,
        error: e,
        stackTrace: stackTrace,
        emit: emit,
      );
    }
  }

  FutureOr<T> actOnData(Event event, DataState<T> initialState) =>
      _act(event, initialState);

  FutureOr<void> handleActError({
    required Event event,
    required DataState<T> initialState,
    required dynamic error,
    required StackTrace stackTrace,
    required Emitter<DataState<T>> emit,
    bool temporary = false,
  }) {
    if (_errorHandler != null) {
      return _errorHandler!(
        event: event,
        emit: emit,
        error: error,
        initialState: initialState,
        stackTrace: stackTrace,
        temporary: temporary,
      );
    }
    emit(ErrorDataState(
      data: initialState.dataOrNull(),
      error: error,
      loadingType: loadingType,
      stackTrace: stackTrace,
      temporary: autoRecoverFromError,
    ));
    if (autoRecoverFromError) {
      emit(initialState);
    }
  }

  /// Runs a task (usually a data operation).
  ///
  /// This will automatically emit a [LoadingDataState] if the runnable returns a future or if [alwaysEmitLoading] is true.
  @protected
  FutureOr<T> runWithLoading(Event event, DataState<T> initialState,
      Emitter<DataState<T>> emit) async {
    final futureOrData = actOnData(event, initialState);
    if (!alwaysEmitLoading && futureOrData is! Future) {
      return futureOrData;
    }

    emit(getLoadingState(event, initialState));
    return await futureOrData;
  }

  @protected
  LoadingDataState<T> getLoadingState(Event event, DataState<T> initialState) {
    if (_loadingGetter != null) {
      return _loadingGetter!(event, initialState);
    }
    return LoadingDataState(
        data: initialState.dataOrNull(), loadingType: loadingType);
  }
}

typedef CanAct<E, T> = bool Function(E event, DataState<T> initialState);
typedef LoadingGetter<E, T> = LoadingDataState<T> Function(
    E event, DataState<T> initialState);
typedef ErrorHandler<E, T> = FutureOr<void> Function({
  required E event,
  required DataState<T> initialState,
  required dynamic error,
  required StackTrace stackTrace,
  required Emitter<DataState<T>> emit,
  bool temporary,
});
