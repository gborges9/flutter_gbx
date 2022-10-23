import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gbx_bloc/gbx_bloc.dart';

class FakeSyncRefreshableDataBloc extends DataBloc with RefreshableData {
  bool throwError;
  bool autoRecover;
  dynamic next;

  FakeSyncRefreshableDataBloc(
      {this.throwError = false, this.autoRecover = true});

  @override
  bool get autoRecoverFromRefreshError => autoRecover;

  @override
  FutureOr refreshData(RefreshData event, DataState initialState) {
    if (throwError) {
      throw Exception("Error refreshing data!");
    }
    return 1;
  }
}

void main() {
  group(
    "Sync RefreshableData DataBloc",
    () {
      blocTest(
        "Should emit nothing when [UninitializedDataState] and RefreshData",
        build: () => FakeSyncRefreshableDataBloc(),
        act: (bloc) => bloc.add(const RefreshData()),
        expect: () => [],
      );

      blocTest<FakeSyncRefreshableDataBloc, DataState>(
        "Should emit nothing when [LoadingDataState] and RefreshData",
        build: () => FakeSyncRefreshableDataBloc(),
        seed: () => DataState.loading(),
        act: (bloc) => bloc.add(const RefreshData()),
        expect: () => [],
      );

      blocTest<FakeSyncRefreshableDataBloc, DataState>(
        "Should emit [LoadedState] when [LoadedState] and RefreshData",
        build: () => FakeSyncRefreshableDataBloc(),
        seed: () => const DataState.loaded(data: 2),
        act: (bloc) => bloc.add(const RefreshData()),
        expect: () => [isA<LoadedDataState>()],
      );

      blocTest<FakeSyncRefreshableDataBloc, DataState>(
        "Should emit [ErrorState] and [LoadedState] when [LoadedState] and RefreshData with error",
        build: () => FakeSyncRefreshableDataBloc(throwError: true),
        seed: () => const LoadedDataState(data: 2),
        act: (bloc) => bloc.add(const RefreshData()),
        expect: () => [isA<ErrorDataState>(), isA<LoadedDataState>()],
      );
    },
  );
}
