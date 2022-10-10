import 'package:dependency_injector/src/dependency_store/get_it_dependency_store.dart';
import 'package:dependency_injector/src/exceptions.dart';

import 'dependency_store/dependency_store.dart';

enum DIOption {
  getIt,
}

/// A Calculator.
class InjectorHolder {
  static const defaulDiOption = DIOption.getIt;

  IDependencyStore? _diStore;

  IDependencyStore get diStore {
    if (_diStore == null) {
      return initialize();
    }
    return _diStore!;
  }

  IDependencyStore initialize([DIOption? diOption]) {
    if (_diStore != null) {
      throw const DependencyStoreAlreadyInitializedException();
    }

    _diStore = _getDependencyStoreFromDIOption(diOption ?? defaulDiOption);
    return _diStore!;
  }

  void setCustomDiStore(IDependencyStore store) {
    if (_diStore != null) {
      throw const DependencyStoreAlreadyInitializedException();
    }

    _diStore = store;
  }

  IDependencyStore _getDependencyStoreFromDIOption(DIOption diOption) {
    switch (diOption) {
      case DIOption.getIt:
        return GetItDependencyStore();
      default:
        throw const DependencyStoreNotFoundException();
    }
  }
}
