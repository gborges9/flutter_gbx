part of 'remote_data_bloc.dart';

abstract class RemoteDataEvent {
  const RemoteDataEvent();
}

class InitializeRemoteData extends RemoteDataEvent {
  const InitializeRemoteData();
}
