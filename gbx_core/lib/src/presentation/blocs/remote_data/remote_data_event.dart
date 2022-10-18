part of 'remote_data_bloc.dart';

abstract class RemoteDataEvent {
  const RemoteDataEvent();
}

class InitializeRemoteData extends RemoteDataEvent {
  const InitializeRemoteData();
}

class RefreshRemoteData extends RemoteDataEvent {
  const RefreshRemoteData();
}

class CleanRemoteData extends RemoteDataEvent {
  const CleanRemoteData();
}
