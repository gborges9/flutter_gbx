part of 'data_bloc.dart';

@freezed
class DataState<T> with _$DataState<T> implements IState {
  const DataState._();

  @Implements<IUninitialiazedState>()
  const factory DataState.uninitialized() = UninitializedDataState;

  @Implements<ILoadingState>()
  factory DataState.loading({
    T? data,
    @Default(LoadingType.fetching) LoadingType loadingType,
  }) = LoadingDataState<T>;

  @Implements<IErrorState>()
  const factory DataState.error({
    T? data,
    dynamic error,
    StackTrace? stackTrace,
    @Default(LoadingType.fetching) LoadingType loadingType,
    @Default(false) temporary,
  }) = ErrorDataState<T>;

  @Implements<ILoadedState>()
  const factory DataState.loaded({
    required T data,
    @Default(false) bool firstTimeLoaded,
  }) = LoadedDataState<T>;

  T? dataOrNull() => mapOrNull<T?>(
        loaded: (state) => state.data,
        loading: (state) => state.data,
        error: (state) => state.data,
      );

  bool get isTemporary => mapOrNull(error: (state) => state.temporary) ?? false;
}
