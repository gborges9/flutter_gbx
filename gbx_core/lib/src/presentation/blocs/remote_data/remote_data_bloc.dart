import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gbx_core/src/core/utils/bloc_helpers.dart';
import 'package:gbx_core/src/domain/bloc/bloc_state.dart';

part 'remote_data_event.dart';
part 'remote_data_state.dart';

abstract class RemoteDataBloc<T>
    extends Bloc<RemoteDataEvent<T>, RemoteDataState<T>>
    with BlocHelper
    implements StateStreamable<RemoteDataState<T>> {
  RemoteDataBloc() : super(const RemoteDataUninitialized()) {
    conditionalOn<InitializeRemoteData<T>>(
      handler: handleInitializeData,
      conditional: canInitialize,
    );
    conditionalOn<RefreshRemoteData<T>>(
      handler: handleRefreshData,
      conditional: canRefresh,
    );
    conditionalOn<CleanRemoteData<T>>(
      handler: handleCleanData,
      conditional: canClean,
    );
  }

  bool canInitialize(InitializeRemoteData<T> event, RemoteDataState<T> state) {
    return state is RemoteDataUninitialized;
  }

  bool canRefresh(RefreshRemoteData<T> event, RemoteDataState<T> state) {
    return state is RemoteDataLoaded<T>;
  }

  bool canClean(CleanRemoteData<T> event, RemoteDataState<T> state) {
    return state is RemoteDataLoaded<T>;
  }

  Future<void> handleInitializeData(
    InitializeRemoteData<T> event,
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

  Future<void> handleRefreshData(
    RefreshRemoteData<T> event,
    Emitter<RemoteDataState<T>> emit,
  ) async {
    final state = this.state as InitializedRemoteDataState<T>;
    emit(getRefreshingState(event, state.data));
    try {
      final data = await fetchData(event);
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

  Future<void> handleCleanData(
    CleanRemoteData<T> event,
    Emitter<RemoteDataState<T>> emit,
  ) async {
    emit(const RemoteDataUninitialized());
  }

  /// Fetches the data for the Bloc
  FutureOr<T> fetchData(RemoteDataEvent<T> event);

  RemoteDataLoading<T> getLoadingState(RemoteDataEvent<T> event) =>
      const RemoteDataLoading();
  RemoteDataLoaded<T> getLoadedState(RemoteDataEvent<T> event, T data) =>
      RemoteDataLoaded(data);
  RemoteDataRefreshing<T> getRefreshingState(
          RemoteDataEvent<T> event, T data) =>
      RemoteDataRefreshing(data);
  RemoteDataLoadingFailed<T> getLoadingErrorState(RemoteDataEvent<T> event,
          {dynamic error, StackTrace? stackTrace}) =>
      RemoteDataLoadingFailed(error: error, stackTrace: stackTrace);

  RemoteDataLoadingTemporarySuccess<T> getLoadingTemporarySuccessState(
          RemoteDataEvent<T> event, T data) =>
      RemoteDataLoadingTemporarySuccess(data);
  RemoteDataLoadingTemporaryFail<T> getLoadingTemporaryFailState(
          RemoteDataEvent<T> event, T data,
          {dynamic error, StackTrace? trace}) =>
      RemoteDataLoadingTemporaryFail(data, error: error, stackTrace: trace);
}
