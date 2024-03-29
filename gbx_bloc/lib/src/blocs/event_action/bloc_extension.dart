part of 'event_action.dart';

extension EventActions<E, S> on Bloc<E, S> {
  void registerAction<Event extends E>(EventAction<Event, S> handler) {
    on<Event>(
      (event, emit) => handler.execute(event, state, emit),
      transformer: handler.transformer,
    );
  }
}
