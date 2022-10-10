import 'package:dependency_injector/src/dependency_store/types.dart';
import 'package:dependency_injector/src/exceptions.dart';

import 'dependency_store.dart';
import 'dependency_store_factory.dart';

class HolderDependencyStore implements IDependencyStore {
  IDependencyStore? _diStore;

  static const _defaultDiOption = DIOption.getIt;

  IDependencyStore get diStore {
    if (_diStore == null) {
      return initialize();
    }
    return _diStore!;
  }

  bool get isInitialized => _diStore != null;

  IDependencyStore initialize([DIOption? diOption]) {
    if (_diStore != null) {
      throw const DependencyStoreAlreadyInitializedException();
    }

    _diStore =
        DependencyStoreFactory.getDependencyStory(diOption ?? _defaultDiOption);
    return _diStore!;
  }

  void setCustomDiStore(IDependencyStore store) {
    if (_diStore != null) {
      throw const DependencyStoreAlreadyInitializedException();
    }

    _diStore = store;
  }

  @override
  T get<T extends Object>({String? instanceName}) =>
      diStore.get<T>(instanceName: instanceName);

  @override
  Future<T> getAsync<T extends Object>({String? instanceName}) =>
      diStore.getAsync<T>(instanceName: instanceName);

  @override
  void lazyRegister<T extends Object>(DependencyFactory<T> factoryFunc,
          {String? instanceName}) =>
      diStore.lazyRegister<T>(factoryFunc, instanceName: instanceName);

  @override
  void lazyRegisterAsync<T extends Object>(
          DependencyFactory<Future<T>> factoryFunc,
          {String? instanceName}) =>
      diStore.lazyRegisterAsync<T>(factoryFunc, instanceName: instanceName);

  @override
  void register<T extends Object>(T instance, {String? instanceName}) =>
      diStore.register<T>(instance, instanceName: instanceName);

  @override
  void registerAsync<T extends Object>(
          AsyncDependencyFactory<T> asyncDependency,
          {String? instanceName}) =>
      diStore.registerAsync<T>(asyncDependency, instanceName: instanceName);

  @override
  void registerFactory<T extends Object>(DependencyFactory<T> factory,
          {String? instanceName}) =>
      diStore.registerFactory<T>(factory, instanceName: instanceName);

  @override
  void registerFactoryAsync<T extends Object>(AsyncDependencyFactory<T> factory,
          {String? instanceName}) =>
      diStore.registerFactoryAsync<T>(factory, instanceName: instanceName);
}
