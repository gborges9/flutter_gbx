import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbx_core/gbx_core.dart';

import '../blocs/bloc_state.dart';
import '../blocs/index.dart';

class DataBlocBuilder<B extends DataBloc, S extends DataState<T>, T>
    extends StatelessWidget {
  const DataBlocBuilder({
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
  final void Function(ErrorDataState<T> state)? onError;
  final void Function(LoadedDataState<T> state)? onDataLoaded;
  final BlocWidgetListener<DataState<T>>? listener;

  final bool initializeOnStart;

  @override
  Widget build(BuildContext context) {
    final bloc = this.bloc ?? BlocProvider.of<B>(context);
    if (initializeOnStart && bloc.state is UninitializedDataState) {
      Log.i("Initializing $B");
      (bloc).add(const InitializeData());
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
          current is ErrorDataState || current is LoadedDataState,
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
