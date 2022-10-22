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
  FutureOr fetchData(DataEvent event) {
    if (throwError) {
      throw Exception("error fetching data");
    }
    return next ?? 0;
  }

  @override
  bool get autoRecoverFromRefreshError => autoRecover;
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
        seed: () => const DataState.loaded(data: 1),
        act: (bloc) => bloc.add(const RefreshData()),
        expect: () => [isA<LoadedDataState>()],
      );

      blocTest<FakeSyncRefreshableDataBloc, DataState>(
        "Should emit [ErrorState] and [LoadedState] when [LoadedState] and RefreshData with error",
        build: () => FakeSyncRefreshableDataBloc(throwError: true),
        seed: () => const LoadedDataState(data: 1),
        act: (bloc) => bloc.add(const RefreshData()),
        expect: () => [isA<ErrorDataState>(), isA<LoadedDataState>()],
      );
    },
  );
}
