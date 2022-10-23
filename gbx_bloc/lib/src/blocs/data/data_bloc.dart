import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gbx_bloc/src/blocs/bloc_helpers.dart';
import 'package:gbx_bloc/src/blocs/bloc_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_event.dart';
part 'data_state.dart';
part 'data_bloc.freezed.dart';
part 'base_data_bloc.dart';

abstract class DataBloc<T> extends BaseDataBloc<DataEvent, T> {
  DataBloc({T? initialData, super.alwaysEmitLoading, super.initialState})
      : super(initialData: initialData);

  @override
  void declareWorkflows() {}
}
