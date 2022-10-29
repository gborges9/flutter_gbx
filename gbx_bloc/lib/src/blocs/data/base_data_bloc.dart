part of 'data_bloc.dart';

typedef WorkflowSuccessHandler<Event, Type> = FutureOr<void> Function(
    Event event, Type data, Emitter<DataState<Type>> emit);
typedef WorkflowErrorHandler<Event, Type> = FutureOr<void> Function(
    Event event,
    Type? data,
    bool shouldAutoRecover,
    dynamic error,
    StackTrace stackTrace,
    LoadingType loadingType,
    Emitter<DataState<Type>> emit);
typedef LoadingStateBuilder<DataType> = LoadingDataState<DataType> Function(
  DataState<DataType> initialState,
  LoadingType loadingType,
);

abstract class BaseDataBloc<Event, DataType>
    extends Bloc<Event, DataState<DataType>> with BlocHelper {
  BaseDataBloc({
    DataType? initialData,
    DataState<DataType>? initialState,
    this.alwaysEmitLoading = false,
  })  : assert(initialData == null || initialState == null,
            "Can't define both initialData and initialState!"),
        super(initialState ??
            (initialData != null
                ? DataState.loaded(data: initialData, firstTimeLoaded: true)
                : const DataState.uninitialized())) {
    declareWorkflows();
  }

  final bool alwaysEmitLoading;

  /// Base method to declare different workflows.
  ///
  /// Use this to call [registerWorkflow] with your events.
  @mustCallSuper
  @protected
  void declareWorkflows();

  /// Runs a task (usually a data operation).
  ///
  /// This will automatically emit a [LoadingDataState] if the runnable returns a future or if [alwaysEmitLoading] is true.
  @protected
  FutureOr<V> runWithLoading<V>({
    required FutureOr<V> Function() runnable,
    required LoadingType loadingType,
    required Emitter<DataState<DataType>> emit,
    LoadingStateBuilder<DataType>? loadingBuilder,
  }) async {
    final futureOrData = runnable();
    if (!alwaysEmitLoading && futureOrData is! Future) {
      return futureOrData;
    }

    emit((loadingBuilder ?? defaultLoadingBuilder).call(state, loadingType));
    return await futureOrData;
  }

  @protected
  LoadingDataState<DataType> defaultLoadingBuilder(
    DataState<DataType> initialState,
    LoadingType loadingType,
  ) =>
      LoadingDataState(
          data: initialState.dataOrNull(), loadingType: loadingType);

  /// Register a workflow for a [Event].
  @protected
  void registerWorkflow<E extends Event>({
    required FutureOr<DataType> Function(
            E event, DataState<DataType> initialState)
        job,
    required LoadingType loadingType,
    bool Function(E event, DataState<DataType> state)? canRun,
    WorkflowSuccessHandler<E, DataType>? onSuccess,
    WorkflowErrorHandler<E, DataType>? onError,
    bool autoRecoverFromError = false,
    LoadingStateBuilder<DataType>? loadingStateBuilder,
  }) {
    assert(!autoRecoverFromError || onError == null,
        "You cant define a custom error handler and autoRecoverFromError!");
    conditionalOn<E>(
      conditional: (event, currentState) =>
          canRun?.call(event, currentState) ??
          currentState is! LoadingDataState,
      handler: (event, emit) async {
        final initialState = state;
        try {
          final data = await runWithLoading(
            runnable: () => job(event, initialState),
            loadingType: loadingType,
            emit: emit,
            loadingBuilder: loadingStateBuilder,
          );
          (onSuccess ?? _defaultSuccessHandler).call(event, data, emit);
        } catch (e, trace) {
          await (onError ?? _defaultErrorHandler).call(
              event,
              state.dataOrNull(),
              autoRecoverFromError,
              e,
              trace,
              loadingType,
              emit);
        }
      },
    );
  }

  FutureOr _defaultSuccessHandler(
      Event event, DataType data, Emitter<DataState<DataType>> emit) {
    emit(LoadedDataState(data: data));
  }

  FutureOr _defaultErrorHandler(
    Event event,
    DataType? data,
    bool shouldAutoRecover,
    dynamic error,
    StackTrace stackTrace,
    LoadingType loadingType,
    Emitter<DataState<DataType>> emit,
  ) {
    emit(ErrorDataState(
      data: data,
      error: error,
      stackTrace: stackTrace,
      loadingType: loadingType,
      temporary: shouldAutoRecover,
    ));
    if (shouldAutoRecover) {
      emit(data == null
          ? UninitializedDataState<DataType>()
          : LoadedDataState(data: data, firstTimeLoaded: false));
    }
  }
}
