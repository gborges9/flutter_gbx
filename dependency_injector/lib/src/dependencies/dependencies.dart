import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef BlocBuilder = StateStreamableSource<Object?> Function(
    BuildContext context);

abstract class Dependencies {
  const Dependencies();
  Future<void> inject();
}
