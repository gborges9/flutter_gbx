part of 'event_action.dart';

extension BlocActions<E, S> on Bloc<E, S> {
  void registerHandler<Event extends E>(EventAction<Event, S> handler) {
    on<Event>(
      (event, emit) => handler.execute(event, state, emit),
      transformer: handler.transformer,
    );
  }
}
