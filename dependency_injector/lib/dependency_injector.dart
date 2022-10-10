library dependency_injector;

import 'package:dependency_injector/src/dependency_store/dependency_store.dart';

import 'src/dependency_store/types.dart';
import 'src/injector_holder.dart';

export 'src/dependency_store/types.dart';
export 'src/dependency_store/dependency_store.dart';

class Injector {
  static final _holder = InjectorHolder();

  static T get<T extends Object>({String? instanceName}) =>
      _holder.diStore.get<T>(instanceName: instanceName);

  Future<T> getAsync<T extends Object>({String? instanceName}) =>
      _holder.diStore.getAsync<T>(instanceName: instanceName);

  static void register<T extends Object>(T instance, {String? instanceName}) =>
      _holder.diStore.register<T>(instance, instanceName: instanceName);

  static void lazyRegister<T extends Object>(DependencyFactory<T> factoryFunc,
          {String? instanceName}) =>
      _holder.diStore.lazyRegister<T>(factoryFunc, instanceName: instanceName);

  static void lazyRegisterAsync<T extends Object>(
          DependencyFactory<Future<T>> factoryFunc,
          {String? instanceName}) =>
      _holder.diStore
          .lazyRegisterAsync<T>(factoryFunc, instanceName: instanceName);

  static void registerFactory<T extends Object>(DependencyFactory<T> factory,
          {String? instanceName}) =>
      _holder.diStore.registerFactory<T>(factory, instanceName: instanceName);

  static void registerAsync<T extends Object>(
          AsyncDependencyFactory<T> asyncDependency,
          {String? instanceName}) =>
      registerAsync<T>(asyncDependency, instanceName: instanceName);

  static void registerFactoryAsync<T extends Object>(
          AsyncDependencyFactory<T> factory,
          {String? instanceName}) =>
      _holder.diStore
          .registerFactoryAsync<T>(factory, instanceName: instanceName);

  static void initialize({DIOption? diOption, IDependencyStore? customStore}) {
    assert((diOption != null && customStore != null),
        "You can't provide a diOption and a custom store at the same time!");

    if (customStore != null) {
      _holder.setCustomDiStore(customStore);
    } else {
      _holder.initialize(diOption);
    }
  }
}
