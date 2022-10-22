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
    return state is LoadedRemoteDataState<T>;
  }

  /// Handles the [AppendRemoteData] event.
  Future<void> handleAppendData(
    E event,
    Emitter<RemoteDataState<T>> emit,
  ) async {
    final initialData = state.dataOrNull()!;
    emit(LoadingRemoteDataState(
        data: initialData, loadingType: LoadingType.appending));
    try {
      final data = await appendData(event, initialData);
      emit(LoadedRemoteDataState(data: data));
    } catch (e, trace) {
      emit(ErrorRemoteDataState(
          data: initialData,
          error: e,
          stackTrace: trace,
          loadingType: LoadingType.appending,
          temporary: true));
      emit(LoadedRemoteDataState(data: initialData));
    }
  }

  /// Append the data and return the resulting list
  Future<T> appendData(E event, T oldList);
}

class AppendRemoteData<T> extends RemoteDataEvent {
  const AppendRemoteData({required this.newItems});

  final T newItems;
}
