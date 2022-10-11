import 'dart:async';

import 'package:get_it/get_it.dart';

import 'dependency_store.dart';
import 'types.dart';

class GetItDependencyStore extends IDependencyStore {
  GetIt get store => GetIt.instance;

  @override
  T get<T extends Object>({String? instanceName}) =>
      store.get<T>(instanceName: instanceName);

  @override
  Future<T> getAsync<T extends Object>({String? instanceName}) =>
      store.getAsync<T>(instanceName: instanceName);

  @override
  void registerFactory<T extends Object>(DependencyFactory<T> factory,
          {String? instanceName}) =>
      store.registerFactory(factory, instanceName: instanceName);

  @override
  void register<T extends Object>(T instance, {String? instanceName}) =>
      store.registerSingleton(instance, instanceName: instanceName);

  @override
  void registerAsync<T extends Object>(
          AsyncDependencyFactory<T> asyncDependency,
          {String? instanceName}) =>
      store.registerSingletonAsync(asyncDependency, instanceName: instanceName);

  @override
  void registerFactoryAsync<T extends Object>(AsyncDependencyFactory<T> factory,
          {String? instanceName}) =>
      store.registerFactoryAsync(factory, instanceName: instanceName);

  @override
  void lazyRegister<T extends Object>(DependencyFactory<T> factoryFunc,
      {String? instanceName}) {
    store.registerLazySingleton(factoryFunc, instanceName: instanceName);
  }

  @override
  void lazyRegisterAsync<T extends Object>(
      DependencyFactory<Future<T>> factoryFunc,
      {String? instanceName}) {
    store.registerSingletonAsync(factoryFunc, instanceName: instanceName);
  }
}
