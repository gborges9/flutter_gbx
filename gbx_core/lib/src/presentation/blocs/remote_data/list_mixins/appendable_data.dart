import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/bloc/bloc_state.dart';
import '../remote_data_bloc.dart';

/// A Mixin for [RemoteDataBloc]s with appendable data.
///
/// Use it if you need to append more data over time in your bloc.
mixin AppendableData<T extends Iterable, E extends AppendRemoteData>
    on RemoteDataBloc<T> {
  @override
  void declareEvents() {
    super.declareEvents();
    conditionalOn<E>(
      handler: handleAppendData,
      conditional: canAppend,
    );
  }

  /// Defines if the event will be handled or discarted.
  ///
  /// By default, it will only be handled if the current state is [RemoteDataLoaded].
  bool canAppend(E event, RemoteDataState<T> state) {
    return state is RemoteDataLoaded<T>;
  }

  /// Handles the [AppendRemoteData] event.
  Future<void> handleAppendData(
    E event,
    Emitter<RemoteDataState<T>> emit,
  ) async {
    final state = this.state as InitializedRemoteDataState<T>;
    emit(getAppendingState(event, state.data));
    try {
      final data = await appendData(event, state.data);
      emit(getLoadingTemporarySuccessState(event, data));
      emit(getLoadedState(event, data));
    } catch (e, trace) {
      emit(getLoadingTemporaryFailState(
        event,
        state.data,
        error: e,
        trace: trace,
      ));
      emit(getLoadedState(event, state.data));
    }
  }

  /// Append the data and return the resulting list
  Future<T> appendData(E event, T oldList);

  RemoteDataAppending<T> getAppendingState(E event, T data) =>
      RemoteDataAppending(data);
}

class AppendRemoteData<T> extends RemoteDataEvent {
  const AppendRemoteData({required this.newItems});

  final T newItems;
}

class RemoteDataAppending<T> extends InitializedRemoteDataState<T>
    implements LoadingState {
  const RemoteDataAppending(super.data);
}
