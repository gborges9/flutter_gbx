import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gbx_bloc/gbx_bloc.dart';

class FakeSyncSettableDataBloc extends DataBloc with SettableData {
  bool throwError;
  bool autoRecover;

  FakeSyncSettableDataBloc({this.throwError = false, this.autoRecover = false});

  @override
  FutureOr fetchData(DataEvent event) {
    return 5;
  }

  @override
  FutureOr setData(SetData event) {
    if (throwError) {
      throw Exception("error setting data");
    }
    return event.newData;
  }

  @override
  bool get autoRecoverOnSetError => autoRecover;
}

void main() {
  group(
    "Sync SettableData DataBloc",
    () {
      blocTest(
        "Should emit [LoadedState] when [UninitializedDataState] and SetData",
        build: () => FakeSyncSettableDataBloc(),
        act: (bloc) => bloc.add(const SetData(newData: 5)),
        expect: () => [isA<LoadedDataState>()],
      );

      blocTest<FakeSyncSettableDataBloc, DataState>(
        "Should emit [LoadedState] when [LoadedDataState] and SetData",
        build: () => FakeSyncSettableDataBloc(),
        seed: () => const DataState.loaded(data: 1),
        act: (bloc) => bloc.add(const SetData(newData: 5)),
        expect: () => [isA<LoadedDataState>()],
      );

      blocTest<FakeSyncSettableDataBloc, DataState>(
        "Should not emit when [LoadingDataState] and SetData",
        build: () => FakeSyncSettableDataBloc(),
        seed: () => DataState.loading(),
        act: (bloc) => bloc.add(const SetData(newData: 5)),
        expect: () => [],
      );

      blocTest<FakeSyncSettableDataBloc, DataState>(
        "Should emit [LoadedDataState] when [ErrorDataState] and SetData",
        build: () => FakeSyncSettableDataBloc(),
        seed: () => const DataState.error(),
        act: (bloc) => bloc.add(const SetData(newData: 5)),
        expect: () => [isA<LoadedDataState>()],
      );

      blocTest<FakeSyncSettableDataBloc, DataState>(
        "Should emit [ErrorDataState] when [LoadedDataState] SetData fails",
        build: () => FakeSyncSettableDataBloc(throwError: true),
        seed: () => const DataState.loaded(data: 1),
        act: (bloc) => bloc.add(const SetData(newData: 5)),
        expect: () => [isA<ErrorDataState>()],
      );

      blocTest<FakeSyncSettableDataBloc, DataState>(
        "Should emit [ErrorDataState] and then [LoadedDataState] when [LoadedDataState] SetData fails and autoRecover",
        build: () =>
            FakeSyncSettableDataBloc(throwError: true, autoRecover: true),
        seed: () => const DataState.loaded(data: 1),
        act: (bloc) => bloc.add(const SetData(newData: 5)),
        expect: () => [isA<ErrorDataState>(), isA<LoadedDataState>()],
      );

      blocTest<FakeSyncSettableDataBloc, DataState>(
        "Should emit [ErrorDataState] and then [UninitializedDataState] when [UninitializedDataState] SetData fails and autoRecover",
        build: () =>
            FakeSyncSettableDataBloc(throwError: true, autoRecover: true),
        seed: () => const DataState.uninitialized(),
        act: (bloc) => bloc.add(const SetData(newData: 5)),
        expect: () => [isA<ErrorDataState>(), isA<UninitializedDataState>()],
      );

      test(
        'Should emit [LoadedState] with data 5 when [UninitializedDataState] and SetData(5)',
        () async {
          // Arrange
          final bloc = FakeSyncSettableDataBloc();

          // Act
          bloc.add(const SetData(newData: 5));

          // Assert
          await expectLater(bloc.stream, emits(isA<LoadedDataState>()));
          expect(bloc.state.dataOrNull(), equals(5));
        },
      );
    },
  );
}
