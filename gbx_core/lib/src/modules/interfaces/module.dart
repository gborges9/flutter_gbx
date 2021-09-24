import 'package:gbx_core/src/modules/get_dependency_injector.dart';

import 'dependency_injector.dart';

abstract class Module {
  Future<void> init();
}
