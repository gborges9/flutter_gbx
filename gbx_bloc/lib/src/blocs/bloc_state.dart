abstract class IState {
  const IState();
}

/// Interface for every state that represents an uninitialized data state.
abstract class IUninitialiazedState extends IState {
  const IUninitialiazedState();
}

abstract class ILoadingState<T> extends IState {
  final T? data;

  const ILoadingState({this.data});
}

abstract class ILoadedState<T> extends IState {
  final T data;

  const ILoadedState({required this.data});
}

/// Interface for error states
abstract class IErrorState<T> extends IState {
  final T? data;
  final dynamic error;
  final StackTrace? stackTrace;

  const IErrorState({this.data, this.error, this.stackTrace});
}

enum LoadingType {
  fetching,
  refreshing,
  loadingMore,
  setting,
  cleaning,
  appending,
}
