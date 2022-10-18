import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/bloc/bloc_state.dart';
import '../remote_data_bloc.dart';

/// A Mixin for refreshable [RemoteDataBloc]s.
///
/// Use it if you need to refresh the data of your bloc.
mixin SettableData<T, E extends SetRemoteData<T>> on RemoteDataBloc<T> {
  @override
  void declareEvents() {
    super.declareEvents();
    conditionalOn<E>(
      handler: handleSetData,
      conditional: canSet,
    );
  }

  /// Defines if the event will be handled or discarted.
  /// By default, it will only be handled if the current state is [RemoteDataLoaded].
  bool canSet(E event, RemoteDataState<T> state) {
    return state is RemoteDataLoaded<T>;
  }

  /// Handles the [SetRemoteData] event.
  Future<void> handleSetData(
    E event,
    Emitter<RemoteDataState<T>> emit,
  ) async {
    final state = this.state as InitializedRemoteDataState<T>;
    emit(getSettingDataState(event, state.data));
    try {
      final data = await setData(event);
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

  /// Sets the remote data and return the new instance of it.
  Future<T> setData(E event);

  SettingRemoteData<T> getSettingDataState(E event, T data) =>
      SettingRemoteData(
        data: data,
        newData: event.newData,
      );
}

class SetRemoteData<T> extends RemoteDataEvent {
  const SetRemoteData({required this.newData});

  final T newData;
}

class SettingRemoteData<T> extends InitializedRemoteDataState<T>
    implements LoadingState {
  final T newData;
  const SettingRemoteData({required T data, required this.newData})
      : super(data);
}
