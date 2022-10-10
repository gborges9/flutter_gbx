import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef BlocBuilder = StateStreamableSource<Object?> Function(
    BuildContext context);

class Dependencies {
  Future<void> inject() async {}

  /// Gets a [List] of all the [BlocProvider]s that are available globally.
  ///
  /// To add a new dependency, extend this method and return a list containing
  /// your [BlocProvider]s appended with the [BlocProvider]s that you get from
  /// the super call.
  ///
  /// REMEMBER TO CALL SUPER!!!
  List<BlocProvider> getGlobalBlocProviders() {
    return [];
  }
}
