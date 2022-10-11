import 'package:gbx_di/gbx_di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin BlocDependencies on Dependencies {
  List<BlocProvider> getGlobalBlocProviders();
}
