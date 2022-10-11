import 'package:gbx_di/gbx_di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin BlocDependencies on Dependencies {
  List<BlocProvider> getGlobalBlocProviders();
}
mixin BlocAppDependencies on AppDependencies {
  List<BlocProvider> getGlobalBlocProviders() {
    var providers = <BlocProvider>[];
    for (var dependency in dependencies) {
      if (dependency is BlocDependencies) {
        providers.addAll(dependency.getGlobalBlocProviders());
      }
    }
    return providers;
  }
}
