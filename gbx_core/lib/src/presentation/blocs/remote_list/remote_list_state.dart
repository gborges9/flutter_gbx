part of 'remote_list_bloc.dart';

abstract class InitializedRemoteListState<T> {
  final List<T> values;

  const InitializedRemoteListState({required this.values});
}

@freezed
class RemoteListState<T> with _$RemoteListState<T> {
  @Implements<UninitialiazedState>()
  const factory RemoteListState.uninitialized() = RemoteListUninitialized;
  @Implements<LoadingState>()
  const factory RemoteListState.initialFetching() = RemoteListInitialFetching;
  @Implements<LoadingState>()
  @Implements<InitializedRemoteListState>()
  const factory RemoteListState.fetchingMore({required List<T> values}) =
      RemoteListFetchingMore;
  @Implements<LoadingState>()
  const factory RemoteListState.refreshing({List<T>? values}) =
      RemoteListRefreshing;
  @Implements<InitializedRemoteListState>()
  const factory RemoteListState.loaded({required List<T> values}) =
      RemoteListLoaded;

  @Implements<TemporaryErrorState>()
  const factory RemoteListState.initialFetchError(
      {String? message,
      dynamic error,
      StackTrace? stackTrace}) = RemoteListInitialFetchError;

  @Implements<TemporaryErrorState>()
  const factory RemoteListState.fetchError(
      {required List<T> values,
      String? message,
      dynamic error,
      StackTrace? stackTrace}) = RemoteListFetchError;

  const RemoteListState._();

  List<T>? getValues() {
    return maybeMap<List<T>?>(
      refreshing: (value) => value.values,
      fetchingMore: (value) => value.values,
      loaded: (value) => value.values,
      fetchError: (value) => value.values,
      orElse: () => null,
    );
  }

  T? getValueAt(int index) => getValues()?.elementAt(index);

  bool get isLoading => this is LoadingState;

  bool get isError => this is ErrorState;

  bool get isTemporary => this is TemporaryState;
}
