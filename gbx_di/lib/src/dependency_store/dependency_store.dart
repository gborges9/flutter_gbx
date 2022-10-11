import 'types.dart';

abstract class IDependencyStore {
  IDependencyStore();

  T get<T extends Object>({String? instanceName});

  Future<T> getAsync<T extends Object>({String? instanceName});

  void register<T extends Object>(T instance, {String? instanceName});

  void lazyRegister<T extends Object>(DependencyFactory<T> factoryFunc,
      {String? instanceName});

  void registerFactory<T extends Object>(DependencyFactory<T> factory,
      {String? instanceName});

  void lazyRegisterAsync<T extends Object>(
      DependencyFactory<Future<T>> factoryFunc,
      {String? instanceName});

  void registerAsync<T extends Object>(
      AsyncDependencyFactory<T> asyncDependency,
      {String? instanceName});

  void registerFactoryAsync<T extends Object>(AsyncDependencyFactory<T> factory,
      {String? instanceName});
}
