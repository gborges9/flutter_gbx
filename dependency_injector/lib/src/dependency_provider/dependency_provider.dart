import 'package:gbx_di/dependency_injector.dart';
import 'package:gbx_di/src/dependency_store/dependency_store_factory.dart';
import 'package:flutter/material.dart';

class DependencyProvider extends StatelessWidget {
  final List<Dependencies> dependencies;
  final DIOption? diOption;
  final WidgetBuilder builder;
  final Widget? onLoading;
  final IDependencyStore? customStore;

  const DependencyProvider({
    super.key,
    required this.dependencies,
    required this.builder,
    this.diOption,
    this.onLoading,
    this.customStore,
  }) : assert(diOption == null || customStore == null,
            "You can't provide a diOption and a custom store at the same time!");

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      builder: buildWidget,
      future: injectDependencies(),
    );
  }

  Future<bool> injectDependencies() async {
    if (!Injector.isInitialized) {
      customStore != null
          ? Injector.setCustomDiStore(customStore!)
          : Injector.initialize(diOption);
    }

    for (var dependency in dependencies) {
      await dependency.inject();
    }

    return true;
  }

  Widget buildWidget(BuildContext context, AsyncSnapshot<bool> snapshot) {
    if (snapshot.hasData && snapshot.requireData) {
      return builder(context);
    }
    return onLoading ?? const SizedBox();
  }
}
