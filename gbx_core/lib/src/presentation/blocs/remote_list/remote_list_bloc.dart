import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gbx_core/src/core/utils/bloc_stream.dart';
import 'package:gbx_core/src/domain/bloc/bloc_state.dart';

part 'remote_list_event.dart';
part 'remote_list_state.dart';
part 'remote_list_bloc.freezed.dart';

abstract class RemoteListBloc<Type>
    extends Bloc<RemoteListEvent, RemoteListState<Type>> with StreamStates {
  RemoteListBloc(
      [RemoteListState<Type> initialState =
          const RemoteListState.uninitialized()])
      : super(initialState) {
    maybeOnStream<RemoteListInitializeEvent>(
        canInitialize, mapInitializeEventToState);

    maybeOnStream<RemoteListFetchMoreEvent>(
        canFetchMore, mapFetchMoreEventToState);

    maybeOnStream<RemoteListRefreshEvent>(canRefresh, mapRefreshEventToState);

    maybeOnStream<RemoteListCleanEvent>(canClean, mapCleanEventToState);
  }

  @protected
  bool canInitialize(RemoteListInitializeEvent event,
          RemoteListState<Type> currentState) =>
      currentState is RemoteListUninitialized;

  @protected
  bool canClean(
          RemoteListCleanEvent event, RemoteListState<Type> currentState) =>
      true;

  @protected
  bool canFetchMore(
          RemoteListFetchMoreEvent event, RemoteListState<Type> currentState) =>
      currentState is RemoteListLoaded;

  @protected
  bool canRefresh(
          RemoteListRefreshEvent event, RemoteListState<Type> currentState) =>
      currentState is RemoteListLoaded;

  @protected
  Stream<RemoteListState<Type>> mapInitializeEventToState(
      RemoteListInitializeEvent event, RemoteListState<Type> state) async* {
    yield const RemoteListState.initialFetching();

    try {
      final initialList = await fetchInitialItems(event, state);
      yield RemoteListState.loaded(values: initialList);
    } catch (e, trace) {
      yield RemoteListState.initialFetchError(error: e, stackTrace: trace);
      yield const RemoteListState.uninitialized();
    }
  }

  @protected
  Stream<RemoteListState<Type>> mapFetchMoreEventToState(
      RemoteListFetchMoreEvent event, RemoteListState<Type> state) async* {
    List<Type> oldList = state.getValues()!;
    yield RemoteListState<Type>.fetchingMore(values: oldList);

    try {
      final newItems = await fetchMoreItems(event, state);
      yield RemoteListState.loaded(values: [...oldList, ...newItems]);
    } catch (e, trace) {
      yield RemoteListState.fetchError(
          values: oldList, error: e, stackTrace: trace);
      yield RemoteListState.loaded(values: oldList);
    }
  }

  @protected
  Stream<RemoteListState<Type>> mapRefreshEventToState(
      RemoteListRefreshEvent event, RemoteListState<Type> state) async* {
    List<Type> oldValues = state.getValues()!;
    yield RemoteListState<Type>.refreshing(values: state.getValues());

    try {
      final newItems = await refreshItems(event, state);
      yield RemoteListState.loaded(values: newItems);
    } catch (e, trace) {
      yield RemoteListState.fetchError(
          values: oldValues, error: e, stackTrace: trace);
      yield RemoteListState.loaded(values: oldValues);
    }
  }

  @protected
  Stream<RemoteListState<Type>> mapCleanEventToState(
      RemoteListCleanEvent event, RemoteListState<Type> state) async* {
    await onCleanItems(event, state);
    yield const RemoteListState.uninitialized();
  }

  @protected
  Future<List<Type>> fetchInitialItems(
      RemoteListInitializeEvent event, RemoteListState<Type> state);

  @protected
  Future<List<Type>> fetchMoreItems(
      RemoteListFetchMoreEvent event, RemoteListState<Type> state);

  @protected
  Future<List<Type>> refreshItems(
      RemoteListRefreshEvent event, RemoteListState<Type> state);

  @protected
  Future<void> onCleanItems(
      RemoteListCleanEvent event, RemoteListState<Type> state) async {}
}
