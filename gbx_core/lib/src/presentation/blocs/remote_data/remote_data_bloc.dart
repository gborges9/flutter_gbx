import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gbx_core/src/core/utils/bloc_helpers.dart';
import 'package:gbx_core/src/domain/bloc/bloc_state.dart';

part 'remote_data_event.dart';
part 'remote_data_state.dart';

abstract class RemoteDataBloc<T>
    extends Bloc<RemoteDataEvent, RemoteDataState<T>> with BlocHelper {
  RemoteDataBloc() : super(const RemoteDataUninitialized()) {
    conditionalOn<InitializeRemoteData>(
      handler: handleInitializeData,
      conditional: canInitialize,
    );
    conditionalOn<RefreshRemoteData>(
      handler: handleRefreshData,
      conditional: canRefresh,
    );
    conditionalOn<CleanRemoteData>(
      handler: handleCleanData,
      conditional: canClean,
    );
  }

  bool canInitialize(InitializeRemoteData event, RemoteDataState<T> state) {
    return state is RemoteDataUninitialized;
  }

  bool canRefresh(RefreshRemoteData event, RemoteDataState<T> state) {
    return state is RemoteDataLoaded<T>;
  }

  bool canClean(CleanRemoteData event, RemoteDataState<T> state) {
    return state is RemoteDataLoaded<T>;
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

  Future<void> handleRefreshData(
    RefreshRemoteData event,
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
    CleanRemoteData event,
    Emitter<RemoteDataState<T>> emit,
  ) async {
    emit(const RemoteDataUninitialized());
  }

  /// Fetches the data for the Bloc
  FutureOr<T> fetchData(RemoteDataEvent event);

  RemoteDataLoading<T> getLoadingState(RemoteDataEvent event) =>
      const RemoteDataLoading();
  RemoteDataLoaded<T> getLoadedState(RemoteDataEvent event, T data) =>
      RemoteDataLoaded(data);
  RemoteDataRefreshing<T> getRefreshingState(RemoteDataEvent event, T data) =>
      RemoteDataRefreshing(data);
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
