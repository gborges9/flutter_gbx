part of 'remote_list_bloc.dart';

abstract class RemoteListEvent {
  const RemoteListEvent();
}

abstract class RemoteListInitializeEvent extends RemoteListEvent {}

abstract class RemoteListFetchMoreEvent extends RemoteListEvent {}

abstract class RemoteListRefreshEvent extends RemoteListEvent {}

class RemoteListCleanEvent extends RemoteListEvent {
  const RemoteListCleanEvent();
}
