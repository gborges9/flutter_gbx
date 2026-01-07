import 'dart:async';

import 'package:injector/injector.dart';

import 'dependency_store.dart';
import 'types.dart';

class InjectorDependencyStore extends IDependencyStore {
  final injector = Injector();

  @override
  T get<T extends Object>({String? instanceName}) =>
      injector.get<T>(dependencyName: instanceName ?? "");

  @override
  Future<T> getAsync<T extends Object>({String? instanceName}) async {
    return get<Future<T>>(instanceName: instanceName);
  }

  @override
  void registerFactory<T extends Object>(DependencyFactory<T> factory,
          {String? instanceName}) =>
      injector.register<T>(
        Factory.provider(() => factory()),
        dependencyName: instanceName ?? "",
      );

  @override
  void register<T extends Object>(T instance, {String? instanceName}) =>
      injector.registerSingleton<T>(
        () => instance,
        dependencyName: instanceName ?? "",
      );

  @override
  void registerAsync<T extends Object>(
          AsyncDependencyFactory<T> asyncDependency,
          {String? instanceName}) =>
      injector.registerSingleton<Future<T>>(
        asyncDependency,
        dependencyName: instanceName ?? "",
      );

  @override
  void registerFactoryAsync<T extends Object>(AsyncDependencyFactory<T> factory,
          {String? instanceName}) =>
      injector.register<Future<T>>(
        Factory.provider(factory),
        dependencyName: instanceName ?? "",
      );

  @override
  void lazyRegister<T extends Object>(DependencyFactory<T> factoryFunc,
          {String? instanceName}) =>
      injector.register(
        Factory.singleton(factoryFunc),
        dependencyName: instanceName ?? "",
      );

  @override
  void lazyRegisterAsync<T extends Object>(
          DependencyFactory<Future<T>> factoryFunc,
          {String? instanceName}) =>
      injector.register(
        Factory.singleton(factoryFunc),
        dependencyName: instanceName ?? "",
      );
}
