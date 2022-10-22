import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gbx_core/src/core/utils/bloc_helpers.dart';
import 'package:gbx_core/src/domain/bloc/bloc_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_data_event.dart';
part 'remote_data_state.dart';
part 'remote_data_bloc.freezed.dart';

abstract class RemoteDataBloc<T>
    extends Bloc<RemoteDataEvent, RemoteDataState<T>> with BlocHelper {
  RemoteDataBloc() : super(const RemoteDataState.uninitialized()) {
    declareEvents();
  }

  void declareEvents() {
    conditionalOn<InitializeRemoteData>(
      handler: handleInitializeData,
      conditional: canInitialize,
    );
  }

  bool canInitialize(InitializeRemoteData event, RemoteDataState<T> state) {
    return state is UninitializedRemoteDataState ||
        state is ErrorRemoteDataState;
  }

  Future<void> handleInitializeData(
    InitializeRemoteData event,
    Emitter<RemoteDataState<T>> emit,
  ) async {
    emit(LoadingRemoteDataState(loadingType: LoadingType.initializing));
    try {
      final data = await fetchData(event);
      emit(LoadedRemoteDataState(data: data, firstTimeLoaded: true));
    } catch (e, trace) {
      emit(ErrorRemoteDataState(
          error: e, stackTrace: trace, loadingType: LoadingType.initializing));
    }
  }

  /// Fetches the data for the Bloc
  FutureOr<T> fetchData(RemoteDataEvent event);
}
