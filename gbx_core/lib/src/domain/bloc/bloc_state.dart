/// Interface for every state that represents an uninitialized data state.
abstract class UninitialiazedState {}

/// Interface for every state that represents fetching or loading data.
abstract class LoadingState {}

/// Interface for error states
abstract class ErrorState {
  final dynamic error;
  final StackTrace? stackTrace;

  ErrorState({this.error, this.stackTrace});
}

/// Interface that defines a temporary state that will be shortly replaced.
abstract class TemporaryState {
  const TemporaryState();
}

/// Interface that represents a temporary success state that will be shortly replaced.
abstract class TemporarySuccessState implements TemporaryState {}

/// Interface that represents a temporary error state that will be shortly replaced.
abstract class TemporaryErrorState extends ErrorState
    implements TemporaryState {}
