import 'package:gbx_di/gbx_di.dart';
import 'package:gbx_di/src/dependency_store/dependency_store_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocDependencyProvider extends StatelessWidget {
  final List<Dependencies> dependencies;
  final DIOption? diOption;
  final WidgetBuilder builder;
  final Widget? onLoading;
  final IDependencyStore? customStore;

  /// Set to true if you want to call the builder method even when dependencies are still loading.
  final bool loadingOptimized;

  const BlocDependencyProvider({
    super.key,
    required this.dependencies,
    required this.builder,
    this.customStore,
    this.diOption,
    this.onLoading,
    this.loadingOptimized = false,
  }) : assert(diOption == null || customStore == null,
            "You can't provide a diOption and a custom store at the same time!");

  Widget wrappedChildBuilder(BuildContext context) {
    List<BlocProvider> providers = [];

    for (var dependency in dependencies) {
      if (dependency is BlocDependencies) {
        providers.addAll(dependency.getGlobalBlocProviders());
      }
    }

    if (providers.isNotEmpty) {
      return MultiBlocProvider(providers: providers, child: builder(context));
    }

    return builder(context);
  }

  @override
  Widget build(BuildContext context) {
    return DependencyProvider(
      dependencies: dependencies,
      builder: wrappedChildBuilder,
      customStore: customStore,
      diOption: diOption,
      onLoading: onLoading,
      loadingOptimized: loadingOptimized,
    );
  }
}
