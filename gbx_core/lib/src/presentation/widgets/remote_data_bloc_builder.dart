import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbx_core/gbx_core.dart';

class RemoteDataBlocBuilder<B extends RemoteDataBloc,
    S extends RemoteDataState<T>, T> extends StatelessWidget {
  const RemoteDataBlocBuilder({
    this.bloc,
    super.key,
    required this.builder,
    this.loadedBuilder,
    this.loadingBuilder,
    this.uninitializedBuilder,
    this.errorBuilder,
    this.onError,
    this.onDataLoaded,
    this.listener,
    this.initializeOnStart = false,
  });

  final B? bloc;
  final BlocWidgetBuilder<S> builder;
  final Widget Function(BuildContext context, T data)? loadedBuilder;
  final Widget Function(BuildContext context, T? data, LoadingType loadingType)?
      loadingBuilder;
  final WidgetBuilder? uninitializedBuilder;
  final Widget Function(BuildContext context, T? data, dynamic error,
      StackTrace? stackTrace, LoadingType loadingType)? errorBuilder;
  final void Function(ErrorRemoteDataState<T> state)? onError;
  final void Function(LoadedRemoteDataState<T> state)? onDataLoaded;
  final BlocWidgetListener<RemoteDataState<T>>? listener;

  final bool initializeOnStart;

  @override
  Widget build(BuildContext context) {
    final bloc = this.bloc ?? BlocProvider.of<B>(context);
    if (initializeOnStart && bloc.state is UninitializedRemoteDataState) {
      Log.i("Initializing $B");
      (bloc).add(const InitializeRemoteData());
    }
    return BlocConsumer<StateStreamable<S>, S>(
      bloc: bloc as StateStreamable<S>,
      builder: (context, state) {
        return state.when(
              uninitialized: () => uninitializedBuilder?.call(context),
              loading: (data, loadingType) =>
                  loadingBuilder?.call(context, data, loadingType),
              error: (data, error, stackTrace, loadingType, _) => errorBuilder
                  ?.call(context, data, error, stackTrace, loadingType),
              loaded: (data, _) => loadedBuilder?.call(context, data),
            ) ??
            builder(context, state);
      },
      listenWhen: (previous, current) =>
          current is ErrorRemoteDataState || current is LoadedRemoteDataState,
      listener: (context, state) {
        state.mapOrNull(
          error: (state) => onError?.call(state),
          loaded: (state) => onDataLoaded?.call(state),
        );

        listener?.call(context, state);
      },
    );
  }
}
