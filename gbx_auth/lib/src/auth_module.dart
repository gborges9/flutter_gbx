import 'package:gbx_auth/src/domain/entities/gbx_user.dart';
import 'package:gbx_core/gbx_core.dart';

import 'data/datasources/auth_remote_data_source.dart';
import 'data/datasources/user_data_local_data_source.dart';
import 'data/datasources/user_data_remote_data_source.dart';
import 'data/repositories/auth_repository_impl.dart';
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

class AuthModule<T extends GbxUser> extends Module {
  AuthModule._(this._authRemoteDataSource, this._dataLocalDataSource,
      this._dataRemoteDataSource);

  final IAuthRemoteDataSource _authRemoteDataSource;
  final IUserDataRemoteDataSource<T> _dataRemoteDataSource;
  final IUserDataLocalDataSource<T> _dataLocalDataSource;

  factory AuthModule({
    IAuthRemoteDataSource? authRemoteDataSource,
    IUserDataLocalDataSource<T>? userLocalDataStore,
    IUserDataRemoteDataSource<T>? userRemoteDataSource,
  }) {
    if (!Get.isRegistered<AuthModule<T>>()) {
      assert(
          authRemoteDataSource != null &&
              userLocalDataStore != null &&
              userRemoteDataSource != null,
          "You must provide the datasources in the first call of AuthModule()");
      Get.put(AuthModule._(
          authRemoteDataSource!, userLocalDataStore!, userRemoteDataSource!));
    }
    return Get.find<AuthModule<T>>();
  }

  LogIn get logIn => Get.find<LogIn>();
  SignUp get signUp => Get.find<SignUp>();
  GetCurrentUser get getCurrentUser => Get.find<GetCurrentUser>();
  UpdateUser get updateUser => Get.find<UpdateUser>();
  BackgroundLogin get backgroundLogin => Get.find<BackgroundLogin>();
  IsLoggedIn get isLoggedIn => Get.find<IsLoggedIn>();
  SignOut get signOut => Get.find<SignOut>();

  @override
  Future<void> init() async {
    var authRepo = AuthRepositoryImpl<T>(
        localDataSource: _dataLocalDataSource,
        remoteDataSource: _dataRemoteDataSource,
        authDataSource: _authRemoteDataSource);

    Get.put<AuthRepositoryImpl<T>>(authRepo);

    Get.lazyPut<LogIn>(() => LogIn(authRepo), fenix: true);
    Get.lazyPut<SignUp>(() => SignUp(authRepo), fenix: true);
    Get.lazyPut<GetCurrentUser>(() => GetCurrentUser(authRepo), fenix: true);
    Get.lazyPut<UpdateUser>(() => UpdateUser(authRepo), fenix: true);
    Get.lazyPut<BackgroundLogin>(() => BackgroundLogin(authRepo), fenix: true);
    Get.lazyPut<IsLoggedIn>(() => IsLoggedIn(authRepo), fenix: true);
    Get.lazyPut<SignOut>(() => SignOut(authRepo), fenix: true);
  }
}
