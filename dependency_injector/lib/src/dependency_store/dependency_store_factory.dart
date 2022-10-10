import 'package:dependency_injector/dependency_injector.dart';
import 'package:dependency_injector/src/dependency_store/get_it_dependency_store.dart';
import 'package:dependency_injector/src/exceptions.dart';

enum DIOption {
  getIt,
}

class DependencyStoreFactory {
  static IDependencyStore getDependencyStory(DIOption diOption) {
    switch (diOption) {
      case DIOption.getIt:
        return GetItDependencyStore();
      default:
        throw const DependencyStoreNotFoundException();
    }
  }
}
