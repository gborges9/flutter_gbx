import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../bloc_state.dart';
import '../data_bloc.dart';

/// A Mixin for [DataBloc]s where you can set the data.
///
/// Use it if you need to set the data of your bloc.
mixin SettableData<E extends SetData, T> on DataBloc<T> {
  @override
  void declareWorkflows() {
    super.declareWorkflows();
    registerWorkflow<E>(
      job: setData,
      canRun: canSet,
      loadingType: LoadingType.setting,
      autoRecoverFromError: autoRecoverFromSetError,
      transformer: setDataTransform,
    );
  }

  /// Defines if the event will be handled or discarted.
  /// By default, it will only be handled if the current state is [DataLoaded].
  bool canSet(E event, DataState<T> state) {
    return state is LoadedDataState<T> ||
        state is UninitializedDataState<T> ||
        state is ErrorDataState<T>;
  }

  /// Sets the  data and return the new instance of it.
  FutureOr<T> setData(E event, DataState<T> initialState);

  bool get autoRecoverFromSetError => false;

  @protected
  EventTransformer<E>? get setDataTransform => null;
}

class SetData<T> extends DataEvent {
  const SetData({required this.newData});

  final T newData;
}
