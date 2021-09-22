import 'package:farm_app/core/classes/dependency_injector.dart';
import 'package:farm_app/core/classes/module.dart';

import 'data/datasources/auth_remote_data_source.dart';
import 'data/datasources/user_data_local_data_source.dart';
import 'data/datasources/user_data_remote_data_source.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'domain/repositories/auth_repository.dart';
import 'domain/usecases/auto_login.dart';
import 'domain/usecases/get_current_user.dart';
import 'domain/usecases/is_logged_in.dart';
import 'domain/usecases/log_in.dart';
import 'domain/usecases/sign_out.dart';
import 'domain/usecases/sign_up.dart';
import 'domain/usecases/update_user.dart';

export 'domain/usecases/auto_login.dart';
export 'domain/usecases/get_current_user.dart';
export 'domain/usecases/is_logged_in.dart';
export 'domain/usecases/log_in.dart';
export 'domain/usecases/sign_out.dart';
export 'domain/usecases/sign_up.dart';
export 'domain/usecases/update_user.dart';

class AuthModule extends Module {
  static AuthModule? _instance;
  static AuthModule get instance => _instance!;

  AuthModule({required IDependencyInjector injector}) : super(injector) {
    _instance = this;
  }

  LogIn get logIn => injector.findDependency<LogIn>();
  SignUp get signUp => injector.findDependency<SignUp>();
  GetCurrentUser get getCurrentUser =>
      injector.findDependency<GetCurrentUser>();
  UpdateUser get updateUser => injector.findDependency<UpdateUser>();
  BackgroundLogin get backgroundLogin =>
      injector.findDependency<BackgroundLogin>();
  IsLoggedIn get isLoggedIn => injector.findDependency<IsLoggedIn>();
  SignOut get signOut => injector.findDependency<SignOut>();

  @override
  Future<void> init() async {
    var authRepo = IAuthRepositoryImpl(
        localDataSource: UserDataLocalDataSourceImpl(),
        remoteDataSource: UserDataRemoteDataSourceImpl(),
        authDataSource: AuthRemoteDataSourceImpl());

    injector.inject<AuthRepository>(authRepo);

    injector.lazyInject<LogIn>(() => LogIn(authRepo), fenix: true);
    injector.lazyInject<SignUp>(() => SignUp(authRepo), fenix: true);
    injector.lazyInject<GetCurrentUser>(() => GetCurrentUser(authRepo),
        fenix: true);
    injector.lazyInject<UpdateUser>(() => UpdateUser(authRepo), fenix: true);
    injector.lazyInject<BackgroundLogin>(() => BackgroundLogin(authRepo),
        fenix: true);
    injector.lazyInject<IsLoggedIn>(() => IsLoggedIn(authRepo), fenix: true);
    injector.lazyInject<SignOut>(() => SignOut(authRepo), fenix: true);
  }
}
