import 'package:gbx_core/src/modules/get_dependency_injector.dart';

import 'dependency_injector.dart';

const _defaultInjector = GetDependencyInjector();

abstract class Module {
  final IDependencyInjector injector;

  Module({IDependencyInjector? injector})
      : injector = injector ?? _defaultInjector;

  Future<void> init();
}
