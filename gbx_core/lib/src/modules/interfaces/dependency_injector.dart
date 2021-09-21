abstract class IDependencyInjector {
  void inject<T>(T value, {bool permanent = false, String? tag});

  void lazyInject<T>(T Function() getter, {bool fenix = false, String? tag});

  T findDependency<T>({String? tag});
}
