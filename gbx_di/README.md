# gbx_di
gbx_di is a dependency injection "abstraction" package, by default, it
uses [get_it](https://pub.dev/packages/get_it) under the hood, but you
can replace it with any other dependency injection package or your own
implementation withou having to change anything else in your code.  

## Getting started

To install the package, add it to the pubspec yaml under dependencies:

```yaml
gbx_di:
    git:
      url: https://github.com/GB0307/flutter_gbx
      path: gbx_di
```

Attention: This package is under active development and doesn`t have a stable 
release yet, use it with caution.

## Basic usage
```dart
Injector.get<T>(); // Get T from the deoendency store.

Injector.getAsync<T>(); // Get T asyncronously used when instances/factories are registered  asynctonously.

Injector.register<T>(instance); // Register instance T

Injector.lazyRegister<T>(()=>instance) // Register a method to register T once you call get for the first time

Injector.lazyRegisterAsync<T>(() async => instance)) // Register a async method to register T once you call get for the first time

Injector.registerAsync<T>(() async => instance) // Register a instance of T as soon as the Future completes

Injector.registerFactory<T>(factoryMethod) // Register a factory to build T every time you call get

Injector.registerFactoryAsync<T>(asyncFactoryMethod) // Registers a async factory method to create T every time you call get
```

## Change the Injector Implementation
By default, gbx_di uses get_it under the hood, but serves as an abstraction layer so that you don't get stuck with it as your app grows, so the package provides an easy solution to replace the default implementation. All you need to do is extend the IDependencyStore class and set it to Injector.
```dart
class MyDependencyStore extends IDependencyStore{
    // ...
}

Injector.setCustomDiStore(MyDependencyStore());
```
Note: you cant register a custom dependency store once it has been initialized, so you need to register it BEFORE calling any get/register methods.

## Feature/Layer dependencies
To register dependencies of a package or layer of your application at once, you can extend the `Dependencies` class and implement the `inject` method, it is better to inject your dependencies in "pieces", separated by feature or layer, instead of placing all of them in the same file.
```dart
class AuthDependencies extends Dependencies{
    @override
    Future<void> inject(){
        // Use injector to inject all of the auth dependencies here
    }
}
```

## Adding new features/layers to your app dependencies
Your app will almost always have more than one feature, to keep things simple and avoid changing too many files when adding a new feature, you can create a class extending `AppDependencies`. `AppDependencies` will take a list of dependencies and inject them one by one when you call its `inject` method, that way you won't have to modify the main or app file when adding a new feature and have a single entry point for new features.
```dart
class MyAppDependencies extends AppDependencies{
    @override
  List<Dependencies> get dependencies => const [
        AuthDependency(),
        MySecondDependency(),
        //...
    ];
}
```

## Injecting dependencies
Once you have your dependencies objects, you have 2 main options to inject them, the first one is to call `inject` manually at any moment (usually in the main method, before runApp), the second is to use the `DependencyProvider` widget:
```dart
BlocDependencyProvider(
    // customStore: ..., // Optional, uses a custom dependency store
    // onLoading: ..., // Optional, Widget to show while dependencies are still loading
    // loadingOptimized: ..., // Optional, if true, will call the builder even when the dependency is still loading
    dependencies: [dependency1, dependency2, /* ... */],
    builder: (context, hasLoaded) => MaterialApp(/* ... */),
);
```