import 'package:gbx_di/gbx_di.dart';
import 'package:gbx_di/src/dependency_store/get_it_dependency_store.dart';
import 'package:gbx_di/src/exceptions.dart';

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
