import 'package:flutter_bloc/flutter_bloc.dart';

import '../data_bloc.dart';

/// A Mixin for cleanable [DataBloc]s.
///
/// Use it if you need to clean the data of your bloc.
mixin CleanableData<T, E extends CleanData> on DataBloc<T> {
  @override
  void declareEvents() {
    super.declareEvents();
    conditionalOn<E>(
      handler: handleCleanData,
      conditional: canClean,
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
