part of 'remote_data_bloc.dart';

abstract class RemoteDataState<T> {
  const RemoteDataState();
}

abstract class UninitializedRemoteDataState<T> extends RemoteDataState<T> {
  const UninitializedRemoteDataState();
}

abstract class InitializedRemoteDataState<T> extends RemoteDataState<T> {
  final T data;
  const InitializedRemoteDataState(this.data);
}

// ###########################
//    Uninitialized States
// ###########################
class RemoteDataUninitialized<T> extends UninitializedRemoteDataState<T>
    implements UninitialiazedState {
  const RemoteDataUninitialized();
}

class RemoteDataLoading<T> extends UninitializedRemoteDataState<T>
    implements LoadingState {
  const RemoteDataLoading();
}

class RemoteDataLoadingFailed<T> extends UninitializedRemoteDataState<T>
    implements ErrorState {
  @override
  final dynamic error;

  @override
  final StackTrace? stackTrace;

  RemoteDataLoadingFailed({this.error, this.stackTrace});
}

// ###########################
//    Initialized States
// ###########################
class RemoteDataLoaded<T> extends InitializedRemoteDataState<T> {
  RemoteDataLoaded(super.data);
}

class RemoteDataRefreshing<T> extends InitializedRemoteDataState<T>
    implements LoadingState {
  RemoteDataRefreshing(super.data);
}

// ###########################
//    Temporary States
// ###########################

class RemoteDataLoadingTemporarySuccess<T> extends InitializedRemoteDataState<T>
    implements TemporarySuccessState {
  RemoteDataLoadingTemporarySuccess(super.data);
}

class RemoteDataLoadingTemporaryFail<T> extends InitializedRemoteDataState<T>
    implements TemporaryErrorState {
  RemoteDataLoadingTemporaryFail(super.data, {this.error, this.stackTrace});

  @override
  final dynamic error;

  @override
  final StackTrace? stackTrace;
}
