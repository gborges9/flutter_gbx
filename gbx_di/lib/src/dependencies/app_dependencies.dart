import 'dart:async';

import 'package:gbx_di/gbx_di.dart';

abstract class AppDependencies extends Dependencies {
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

  List<Dependencies> get dependencies;
}
