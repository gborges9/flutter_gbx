import 'dart:async';

import 'package:bloc/bloc.dart';

typedef EventMapGuard<Event, State> = bool Function(
    Event event, State currentState);

mixin StreamStates<Event, State> on Bloc<Event, State> {
  StreamSubscription<State>? activeMapper;

  void maybeOnStream<E extends Event>(EventMapGuard<E, State> guard,
      Stream<State> Function(E event, State state) eventToState) {
    on<E>((event, emit) async {
      if (!guard(event, state)) {
        return;
      }
      activeMapper?.cancel();
      activeMapper = eventToState(event, state).listen(emit);

      return activeMapper?.asFuture();
    });
  }
}
