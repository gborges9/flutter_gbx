import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'bloc_extension.dart';

abstract class EventAction<Event, State> {
  EventTransformer<Event>? get transformer;

  bool canAct(Event event, State initialState);

  FutureOr<void> execute(Event event, State initialState, Emitter<State> emit) {
    if (canAct(event, initialState)) {
      return act(event, initialState, emit);
    }
  }

  @protected
  FutureOr<void> act(Event event, State initialState, Emitter<State> emit);
}
