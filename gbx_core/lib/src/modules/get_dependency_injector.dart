import 'interfaces/dependency_injector.dart';
import 'package:get/get.dart';

class GetDependencyInjector extends IDependencyInjector {
  @override
  T findDependency<T>({String? tag}) => Get.find<T>(tag: tag);

  @override
  void inject<T>(T value, {bool permanent = false, String? tag}) =>
      Get.put<T>(value, permanent: permanent, tag: tag);

  @override
  void lazyInject<T>(T Function() getter, {bool fenix = false, String? tag}) =>
      Get.lazyPut(getter, fenix: fenix, tag: tag);
}
