import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gbx_bloc/gbx_bloc.dart';

class FakeSyncronousDataBloc extends DataBloc with FetchableData {
  bool throwError;
  FakeSyncronousDataBloc({super.initialData, this.throwError = false});
  @override
  FutureOr<int> fetchData(DataEvent event, DataState initialState) {
    if (throwError) {
      throwError = false;
      throw Exception("Throwing error");
    }
    return 1;
  }
}

class FakeAsyncronousDataBloc extends DataBloc with FetchableData {
  bool throwError;
  FakeAsyncronousDataBloc({super.initialData, this.throwError = false});
  @override
  FutureOr<int> fetchData(DataEvent event, DataState initialState) async {
    if (throwError) {
      throwError = false;
      throw Exception("Throwing error");
    }

    await Future.delayed(const Duration(milliseconds: 50));
    return 42;
  }
}

void main() {
  group(
    "DataBloc initial states",
    () {
      test(
        'Should set state to [UninitializedDataState] when there is no initial data.',
        () => expect(
            FakeSyncronousDataBloc().state, isA<UninitializedDataState>()),
      );

      test(
        'Should set state to [LoadedDataState] when there is initial data.',
        () => expect(FakeSyncronousDataBloc(initialData: 1).state,
            isA<LoadedDataState>()),
      );
    },
  );

  group(
    "Syncronous DataBloc",
    () {
      blocTest(
        'emits [LoadedDataState] when initialized',
        build: () => FakeSyncronousDataBloc(),
        act: (bloc) => bloc.add(const FetchData()),
        expect: () => [
          isA<LoadedDataState>(),
        ],
      );

      blocTest(
        'emits [ErrorDataState] when initialized an error occurs while loading the data',
        build: () => FakeSyncronousDataBloc(throwError: true),
        act: (bloc) => bloc.add(const FetchData()),
        expect: () => [
          isA<ErrorDataState>(),
        ],
      );

      blocTest<DataBloc, DataState>(
        'emits [LoadedDataState] when initialized after an error occurs and loading succeded',
        build: () => FakeSyncronousDataBloc(),
        act: (bloc) => bloc.add(const FetchData()),
        seed: () => const DataState.error(),
        expect: () => [
          isA<LoadedDataState>(),
        ],
      );
    },
  );

  group(
    "Asyncronous DataBloc",
    () {
      blocTest(
        'emits [LoadingDataState] and then [LoadedDataState] when initialized',
        build: () => FakeAsyncronousDataBloc(),
        act: (bloc) => bloc.add(const FetchData()),
        wait: const Duration(milliseconds: 100),
        expect: () => [
          isA<LoadingDataState>(),
          isA<LoadedDataState>(),
        ],
      );
      blocTest(
        'emits [LoadingDataState] and then [ErrorDataState] when initialized and an error occurs while loading the data',
        build: () => FakeAsyncronousDataBloc(throwError: true),
        act: (bloc) => bloc.add(const FetchData()),
        expect: () => [
          isA<LoadingDataState>(),
          isA<ErrorDataState>(),
        ],
      );
    },
  );
}
