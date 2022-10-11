part of 'remote_data_bloc.dart';

abstract class RemoteDataEvent<T> {
  const RemoteDataEvent();
}

class InitializeRemoteData<T> extends RemoteDataEvent<T> {
  const InitializeRemoteData();
}

class RefreshRemoteData<T> extends RemoteDataEvent<T> {
  const RefreshRemoteData();
}

class CleanRemoteData<T> extends RemoteDataEvent<T> {
  const CleanRemoteData();
}
