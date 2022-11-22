
# gbx_core

The core of the flutter_gbx package collection, this package contains
many classes to help you develop a better, scalable apps using the clean
code architecture.

## Getting started

To install the package, add it to the pubspec yaml under dependencies:

```yaml
gbx_core:
    git:
      url: https://github.com/GB0307/flutter_gbx
      path: gbx_core
```

Attention: This package is under active development and doesn`t have a stable 
release yet, use it with caution.
## Usages - UseCase
### BaseUseCase
```dart
class MyUseCase extends BaseUseCase<MyReturnType, MyParams> {
  MyReturnType call({required MyParams params}){
      // TODO: Do something
  }
}
```
### UseCase
```dart
class MyFutureUseCase extends BaseUseCase<MyReturnType, MyParams> {
  Future<MyReturnType> call({required MyParams params}) async {
      // TODO: Do something
  }
}
```
### StreamUseCase
```dart
class MyStreamUseCase extends BaseUseCase<MyReturnType, MyParams> {
  Stream<MyReturnType> call({required MyParams params}) async* {
      // TODO: Do something
  }
}
```

## Usages - Logger
UNDER CONSTRUCTION