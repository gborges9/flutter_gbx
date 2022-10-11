import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbx_di/gbx_di.dart';

abstract class AppDependencies extends Dependencies
    implements BlocDependencies {
  AppDependencies();

  bool get injected => _completer.isCompleted;
  final Completer<bool> _completer = Completer();
  Future<bool> get onComplete => _completer.future;

  @override
  Future<void> inject() async {
    for (var dependency in dependencies) {
      await dependency.inject();
    }
    _completer.complete(true);
  }

  @override
  List<BlocProvider> getGlobalBlocProviders() {
    var providers = <BlocProvider>[];

    for (var dependency in dependencies) {
      if (dependency is BlocDependencies) {
        providers.addAll(dependency.getGlobalBlocProviders());
      }
    }

    return providers;
  }

  List<Dependencies> get dependencies;
}
