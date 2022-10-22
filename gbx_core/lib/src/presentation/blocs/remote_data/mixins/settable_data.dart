import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/bloc/bloc_state.dart';
import '../remote_data_bloc.dart';

/// A Mixin for [RemoteDataBloc]s where you can set the data.
///
/// Use it if you need to set the data of your bloc.
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
    return state is LoadedRemoteDataState<T> ||
        state is UninitializedRemoteDataState<T>;
  }

  /// Handles the [SetRemoteData] event.
  Future<void> handleSetData(
    E event,
    Emitter<RemoteDataState<T>> emit,
  ) async {
    emit(LoadingRemoteDataState(
      data: state.dataOrNull(),
      loadingType: LoadingType.setting,
    ));
    try {
      final data = await setData(event);
      emit(LoadedRemoteDataState(data: data));
    } catch (e, trace) {
      emit(ErrorRemoteDataState(
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
        emit(LoadedRemoteDataState(data: data));
      } else {
        emit(const UninitializedRemoteDataState());
      }
    }
  }

  /// Sets the remote data and return the new instance of it.
  Future<T> setData(E event);

  bool get autoRecoverOnSetError => false;
}

class SetRemoteData<T> extends RemoteDataEvent {
  const SetRemoteData({required this.newData});

  final T newData;
}
