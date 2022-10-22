part of 'remote_data_bloc.dart';

@freezed
class RemoteDataState<T> with _$RemoteDataState<T> implements IState {
  const RemoteDataState._();

  @Implements<IUninitialiazedState>()
  const factory RemoteDataState.uninitialized() = UninitializedRemoteDataState;

  @Implements<ILoadingState>()
  factory RemoteDataState.loading({
    T? data,
    @Default(LoadingType.initializing) LoadingType loadingType,
  }) = LoadingRemoteDataState<T>;

  @Implements<IErrorState>()
  const factory RemoteDataState.error({
    T? data,
    dynamic error,
    StackTrace? stackTrace,
    @Default(LoadingType.initializing) LoadingType loadingType,
    @Default(false) temporary,
  }) = ErrorRemoteDataState<T>;

  @Implements<ILoadedState>()
  const factory RemoteDataState.loaded({
    required T data,
    @Default(false) bool firstTimeLoaded,
  }) = LoadedRemoteDataState<T>;

  T? dataOrNull() => mapOrNull<T?>(
        loaded: (state) => state.data,
        loading: (state) => state.data,
      );

  bool get isTemporary => mapOrNull(error: (state) => state.temporary) ?? false;
}
