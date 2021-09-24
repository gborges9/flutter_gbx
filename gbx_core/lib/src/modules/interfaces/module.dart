import 'package:gbx_core/src/modules/get_dependency_injector.dart';

import 'dependency_injector.dart';

abstract class Module {
  const Module();

  Future<void> init();
}
