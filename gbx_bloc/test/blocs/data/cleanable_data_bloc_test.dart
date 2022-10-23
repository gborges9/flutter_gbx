import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gbx_bloc/gbx_bloc.dart';

class FakeCleanableDataBloc extends DataBloc with CleanableData {
  FakeCleanableDataBloc({super.initialData});
}

void main() {
  group(
    "CleanableDataBloc",
    () {
      blocTest(
        "emit [UninitializedDataState] when loaded and CleanData event",
        build: () => FakeCleanableDataBloc(initialData: 1),
        act: (bloc) => bloc.add(const CleanData()),
        expect: () => [isA<UninitializedDataState>()],
      );
    },
  );

  group(
    "CleanableDataBloc",
    () {
      blocTest(
        "emits nothing when uninitialized and CleanData event",
        build: () => FakeCleanableDataBloc(),
        act: (bloc) => bloc.add(const CleanData()),
        expect: () => [],
      );
    },
  );
}
