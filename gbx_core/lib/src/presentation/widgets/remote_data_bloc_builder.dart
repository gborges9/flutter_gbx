import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/bloc/bloc_state.dart';
import '../blocs/remote_data/remote_data_bloc.dart';

class RemoteDataBlocBuilder<B extends StateStreamable<S>,
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

  final RemoteDataBloc<S>? bloc;
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
    return BlocConsumer<B, S>(
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
        if (state is RemoteDataLoadingTemporaryFail<T>) {
          onError?.call(context, state);
        }
        if (state is RemoteDataLoadingTemporarySuccess<T>) {
          onSuccess?.call(context, state);
        }
        if (initializeOnStart && state is RemoteDataUninitialized<T>) {
          return bloc?.add(const InitializeRemoteData());
        }

        listener?.call(context, state);
      },
      bloc: bloc as B?,
    );
  }
}
