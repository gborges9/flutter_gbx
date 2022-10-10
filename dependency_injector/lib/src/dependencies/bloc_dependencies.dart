import 'package:gbx_di/src/dependencies/dependencies.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin BlocDependencies on Dependencies {
  List<BlocProvider> getGlobalBlocProviders();
}