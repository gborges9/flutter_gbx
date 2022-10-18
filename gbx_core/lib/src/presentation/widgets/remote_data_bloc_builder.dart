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
    this.refreshingBuilder,
    this.errorBuilder,
    this.onError,
    this.onSuccess,
    this.listener,
    this.initializeOnStart = false,
  });

  final B? bloc;
  final BlocWidgetBuilder<S> builder;
  final BlocWidgetBuilder<RemoteDataLoaded<T>>? loadedBuilder;
  final BlocWidgetBuilder<RemoteDataLoading<T>>? loadingBuilder;
  final BlocWidgetBuilder<RemoteDataUninitialized<T>>? uninitializedBuilder;
  final BlocWidgetBuilder<RemoteDataRefreshing<T>>? refreshingBuilder;
  final BlocWidgetBuilder<RemoteDataLoadingFailed<T>>? errorBuilder;
  final BlocWidgetListener<RemoteDataLoadingTemporaryFail>? onError;
  final BlocWidgetListener<RemoteDataLoadingTemporarySuccess>? onSuccess;
  final BlocWidgetListener<RemoteDataState<T>>? listener;

  final bool initializeOnStart;

  @override
  Widget build(BuildContext context) {
    final bloc = this.bloc ?? BlocProvider.of<B>(context);
    if (initializeOnStart && bloc.state is RemoteDataUninitialized) {
      Log.i("Initializing $B");
      (bloc).add(const InitializeRemoteData());
    }
    return BlocConsumer<StateStreamable<S>, S>(
      bloc: bloc as StateStreamable<S>,
      builder: (context, state) {
        if (state is RemoteDataUninitialized<T>) {
          return uninitializedBuilder?.call(context, state) ??
              builder(context, state);
        }
        if (state is RemoteDataRefreshing<T>) {
          return refreshingBuilder?.call(context, state) ??
              builder.call(context, state);
        }
        if (state is RemoteDataLoading<T>) {
          return loadingBuilder?.call(context, state) ??
              builder(context, state);
        }
        if (state is RemoteDataLoaded<T>) {
          return loadedBuilder?.call(context, state) ?? builder(context, state);
        }
        if (state is RemoteDataLoadingFailed<T>) {
          return errorBuilder?.call(context, state) ?? builder(context, state);
        }
        return builder(context, state);
      },
      buildWhen: (previous, current) => current is! TemporaryState,
      listenWhen: (previous, current) =>
          current is TemporaryState || current is RemoteDataUninitialized,
      listener: (context, state) {
        Log.v("GOT STATE AT BUILDER ${state.runtimeType}", type: runtimeType);
        if (state is RemoteDataLoadingTemporaryFail<T>) {
          onError?.call(context, state);
        }
        if (state is RemoteDataLoadingTemporarySuccess<T>) {
          onSuccess?.call(context, state);
        }

        listener?.call(context, state);
      },
    );
  }
}
