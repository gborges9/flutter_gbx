import 'package:dependency_injector/dependency_injector.dart';
import 'package:dependency_injector/src/dependencies/bloc_dependencies.dart';
import 'package:dependency_injector/src/dependencies/dependencies.dart';
import 'package:dependency_injector/src/dependency_provider/dependency_provider.dart';
import 'package:dependency_injector/src/dependency_store/dependency_store_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocDependencyProvider extends StatelessWidget {
  final List<Dependencies> dependencies;
  final DIOption? diOption;
  final WidgetBuilder builder;
  final Widget? onLoading;
  final IDependencyStore? customStore;

  const BlocDependencyProvider({
    super.key,
    required this.dependencies,
    required this.builder,
    this.customStore,
    this.diOption,
    this.onLoading,
  }) : assert(diOption == null || customStore == null,
            "You can't provide a diOption and a custom store at the same time!");

  Widget wrappedChildBuilder(BuildContext context) {
    List<BlocProvider> providers = [];

    for (var dependency in dependencies) {
      if (dependency is BlocDependencies) {
        providers.addAll(dependency.getGlobalBlocProviders());
      }
    }

    return MultiBlocProvider(providers: providers, child: builder(context));
  }

  @override
  Widget build(BuildContext context) {
    return DependencyProvider(
      dependencies: dependencies,
      builder: wrappedChildBuilder,
      customStore: customStore,
      diOption: diOption,
      onLoading: onLoading,
    );
  }
}
