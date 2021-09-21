import 'dependency_injector.dart';

abstract class Module {
  final IDependencyInjector injector;

  Module(this.injector);

  Future<void> init();
}
