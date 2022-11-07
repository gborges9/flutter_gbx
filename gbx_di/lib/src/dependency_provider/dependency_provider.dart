import 'package:gbx_di/gbx_di.dart';
import 'package:gbx_di/src/dependency_store/dependency_store_factory.dart';
import 'package:flutter/material.dart';

typedef DependencyWidgetBuilder = Widget Function(
    BuildContext context, bool hasLoaded);

class DependencyProvider extends StatefulWidget {
  final List<Dependencies> dependencies;
  final DIOption? diOption;
  final DependencyWidgetBuilder builder;
  final Widget? onLoading;
  final IDependencyStore? customStore;

  /// Set to true if you want to call the builder method even when dependencies are still loading.
  final bool loadingOptimized;

  const DependencyProvider({
    super.key,
    required this.dependencies,
    required this.builder,
    this.diOption,
    this.onLoading,
    this.customStore,
    this.loadingOptimized = false,
  }) : assert(diOption == null || customStore == null,
            "You can't provide a diOption and a custom store at the same time!");

  @override
  State<DependencyProvider> createState() => _DependencyProviderState();
}

class _DependencyProviderState extends State<DependencyProvider> {
  late Future<bool> injectFuture;

  @override
  void initState() {
    super.initState();
    injectFuture = injectDependencies();
  }

  Future<bool> injectDependencies() async {
    if (!Injector.isInitialized) {
      widget.customStore != null
          ? Injector.setCustomDiStore(widget.customStore!)
          : Injector.initialize(widget.diOption);
    }

    for (var dependency in widget.dependencies) {
      await dependency.inject();
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      builder: buildWidget,
      future: injectFuture,
    );
  }

  Widget buildWidget(BuildContext context, AsyncSnapshot<bool> snapshot) {
    if (widget.loadingOptimized || (snapshot.hasData && snapshot.requireData)) {
      return widget.builder(context, snapshot.data ?? false);
    }
    return widget.onLoading ?? const SizedBox();
  }
}
