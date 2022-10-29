import 'dart:async';

import 'package:bloc/bloc.dart';

typedef EventHandler<E, S> = FutureOr<void> Function(E event, Emitter<S> emit);
typedef HandlerConditional<E, S> = bool Function(E event, S currentState);

mixin BlocHelper<E, S> on Bloc<E, S> {
  void conditionalOn<Ev extends E>({
    required EventHandler<Ev, S> handler,
    required HandlerConditional<Ev, S> conditional,
    Stream<Ev> Function(Stream<Ev>, Stream<Ev> Function(Ev))? transformer,
  }) {
    on<Ev>(
      (event, emit) {
        if (conditional(event, state)) {
          return handler(event, emit);
        }
      },
      transformer: transformer,
    );
  }
}
