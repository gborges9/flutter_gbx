import 'package:flutter_bloc/flutter_bloc.dart';

import '../remote_data_bloc.dart';

/// A Mixin for cleanable [RemoteDataBloc]s.
///
/// Use it if you need to clean the data of your bloc.
mixin CleanableData<T, E extends CleanRemoteData> on RemoteDataBloc<T> {
  @override
  void declareEvents() {
    super.declareEvents();
    conditionalOn<E>(
      handler: handleCleanData,
      conditional: canClean,
    );
  }

  /// Defines if the event will be handled or discarted.
  /// By default, it will only be handled if the current state is [LoadedRemoteDataState].
  bool canClean(E event, RemoteDataState<T> state) {
    return state is LoadedRemoteDataState<T>;
  }

  /// Handles the [CleanRemoteData] event.
  ///
  /// By default, this will only emit the [UninitializedRemoteDataState] state.
  Future<void> handleCleanData(
    E event,
    Emitter<RemoteDataState<T>> emit,
  ) async {
    emit(const UninitializedRemoteDataState());
  }
}

class CleanRemoteData extends RemoteDataEvent {
  const CleanRemoteData();
}
