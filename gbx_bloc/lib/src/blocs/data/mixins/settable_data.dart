import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc_state.dart';
import '../data_bloc.dart';

/// A Mixin for [DataBloc]s where you can set the data.
///
/// Use it if you need to set the data of your bloc.
mixin SettableData<T, E extends SetData<T>> on DataBloc<T> {
  @override
  void declareEvents() {
    super.declareEvents();
    conditionalOn<E>(
      handler: handleSetData,
      conditional: canSet,
    );
  }

  /// Defines if the event will be handled or discarted.
  /// By default, it will only be handled if the current state is [DataLoaded].
  bool canSet(E event, DataState<T> state) {
    return state is LoadedDataState<T> ||
        state is UninitializedDataState<T> ||
        state is ErrorDataState<T>;
  }

  /// Handles the [SetData] event.
  Future<void> handleSetData(
    E event,
    Emitter<DataState<T>> emit,
  ) async {
    try {
      final data = await runWithLoading(
        runnable: () => setData(event),
        loadingType: LoadingType.setting,
        emit: emit,
      );
      emit(LoadedDataState(data: data));
    } catch (e, trace) {
      emit(ErrorDataState(
        data: state.dataOrNull(),
        error: e,
        stackTrace: trace,
        loadingType: LoadingType.setting,
        temporary: autoRecoverOnSetError,
      ));

      if (!autoRecoverOnSetError) {
        return;
      }

      final data = state.dataOrNull();

      if (data != null) {
        emit(LoadedDataState(data: data));
      } else {
        emit(const UninitializedDataState());
      }
    }
  }

  /// Sets the  data and return the new instance of it.
  FutureOr<T> setData(E event);

  bool get autoRecoverOnSetError => false;
}

class SetData<T> extends DataEvent {
  const SetData({required this.newData});

  final T newData;
}
