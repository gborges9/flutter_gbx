import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/index.dart';

typedef DataWidgetBuilder<S extends DataState> = Widget Function(
    BuildContext context, S state);

class DataBlocBuilder<B extends DataBloc<T>, T> extends StatelessWidget {
  final DataWidgetBuilder<DataState<T>> builder;
  final DataWidgetBuilder<LoadingDataState<T>>? loadingBuilder;
  final DataWidgetBuilder<LoadedDataState<T>>? loadedBuilder;
  final DataWidgetBuilder<ErrorDataState<T>>? errorBuilder;
  final DataWidgetBuilder<UninitializedDataState<T>>? uninitializedBuilder;

  /// Called when a persistent error state is emitted.
  final void Function(ErrorDataState<T> errorState)? onError;

  /// Called when a temporary error state is emitted.
  final void Function(ErrorDataState<T> errorState)? onErrorNotification;

  final void Function(LoadedDataState<T> loadedState)? onLoaded;

  final void Function(BuildContext context, DataState<T> state)? listener;

  final B? bloc;
  final B Function(BuildContext context)? create;

  /// Event to add to the bloc at the initState;
  final DataEvent? initialEvent;
  final bool provide;

  const DataBlocBuilder({
    super.key,
    required this.builder,
    this.onError,
    this.onErrorNotification,
    this.onLoaded,
    this.bloc,
    this.loadingBuilder,
    this.loadedBuilder,
    this.errorBuilder,
    this.uninitializedBuilder,
    this.initialEvent,
    this.provide = false,
    this.listener,
    this.create,
  }) : assert(bloc == null || create == null,
            "Cant define both bloc and create params!");

  @override
  Widget build(BuildContext context) {
    Widget child = BlocConsumer<B, DataState<T>>(
      bloc: bloc,
      listenWhen: (previous, current) => true,
      listener: _listener,
      buildWhen: (previous, current) => !current.isTemporary,
      builder: (context, state) =>
          state.map<Widget?>(
            uninitialized: (state) =>
                uninitializedBuilder?.call(context, state),
            loading: (state) => loadingBuilder?.call(context, state),
            error: (state) => errorBuilder?.call(context, state),
            loaded: (state) => loadedBuilder?.call(context, state),
          ) ??
          builder(context, state),
    );

    if (create != null) {
      child = BlocProvider<B>(
        create: create!,
        child: child,
      );
    }

    return child;
  }

  void _listener(BuildContext context, DataState<T> state) {
    state.mapOrNull(
      error: (state) {
        if (state.isTemporary) {
          onErrorNotification?.call(state);
        } else {
          onError?.call(state);
        }
      },
      loaded: onLoaded,
    );
    listener?.call(context, state);
  }
}
