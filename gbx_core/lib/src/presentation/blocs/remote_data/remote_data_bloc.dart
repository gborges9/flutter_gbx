import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gbx_core/src/core/utils/bloc_helpers.dart';
import 'package:gbx_core/src/domain/bloc/bloc_state.dart';

part 'remote_data_event.dart';
part 'remote_data_state.dart';

abstract class RemoteDataBloc<T>
    extends Bloc<RemoteDataEvent, RemoteDataState<T>> with BlocHelper {
  RemoteDataBloc() : super(const RemoteDataUninitialized()) {
    declareEvents();
  }

  void declareEvents() {
    conditionalOn<InitializeRemoteData>(
      handler: handleInitializeData,
      conditional: canInitialize,
    );
  }

  bool canInitialize(InitializeRemoteData event, RemoteDataState<T> state) {
    return state is RemoteDataUninitialized;
  }

  Future<void> handleInitializeData(
    InitializeRemoteData event,
    Emitter<RemoteDataState<T>> emit,
  ) async {
    emit(getLoadingState(event));
    try {
      final data = await fetchData(event);
      emit(getLoadingTemporarySuccessState(event, data));
      emit(getLoadedState(event, data));
    } catch (e, trace) {
      emit(getLoadingErrorState(event, error: e, stackTrace: trace));
    }
  }

  /// Fetches the data for the Bloc
  FutureOr<T> fetchData(RemoteDataEvent event);

  RemoteDataLoading<T> getLoadingState(RemoteDataEvent event) =>
      const RemoteDataLoading();
  RemoteDataLoaded<T> getLoadedState(RemoteDataEvent event, T data) =>
      RemoteDataLoaded(data);

  RemoteDataLoadingFailed<T> getLoadingErrorState(RemoteDataEvent event,
          {dynamic error, StackTrace? stackTrace}) =>
      RemoteDataLoadingFailed(error: error, stackTrace: stackTrace);

  RemoteDataLoadingTemporarySuccess<T> getLoadingTemporarySuccessState(
          RemoteDataEvent event, T data) =>
      RemoteDataLoadingTemporarySuccess(data);
  RemoteDataLoadingTemporaryFail<T> getLoadingTemporaryFailState(
          RemoteDataEvent event, T data,
          {dynamic error, StackTrace? trace}) =>
      RemoteDataLoadingTemporaryFail(data, error: error, stackTrace: trace);
}
