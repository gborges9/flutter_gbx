import 'dart:async';

abstract class Dependencies {
  const Dependencies();
  Future<void> inject();
}
