part of 'data_bloc.dart';

abstract class DataEvent {
  const DataEvent();
}

class InitializeData extends DataEvent {
  const InitializeData();
}
