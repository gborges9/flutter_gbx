import 'package:dartz/dartz.dart';

import 'package:farm_app/core/navigation/app_router.gr.dart';

import 'package:farm_app/core/utils/either_extensions.dart';
import 'package:farm_app/core/utils/nav_utils.dart';
import 'package:farm_app/features/auth/domain/entities/user.dart';
import 'package:farm_app/features/auth/domain/usecases/get_current_user.dart';
import 'package:farm_app/features/auth/domain/usecases/is_logged_in.dart';
import 'package:farm_app/features/auth/domain/usecases/log_in.dart';
export 'package:farm_app/features/auth/domain/usecases/log_in.dart'
    show LogInParams;
import 'package:farm_app/features/auth/domain/usecases/sign_out.dart';
import 'package:farm_app/features/auth/domain/usecases/sign_up.dart';
export 'package:farm_app/features/auth/domain/usecases/sign_up.dart'
    show SignUpParams;

import 'package:get/get.dart';

class UserController extends GetxController with StateMixin<User> {
  static UserController get to => Get.find<UserController>();

  @override
  void onReady() {
    super.onReady();
    loadUser(false);
  }

  Future<void> loadUser([bool forceRefresh = true]) async {
    print("Loading user!");
    change(state, status: RxStatus.loading());

    var result = await Get.find<GetCurrentUser>().call(forceRefresh);

    if (result.isLeft()) {
      print(result.left);

      return change(null, status: RxStatus.error(result.left.message));
    }

    change(result.right, status: RxStatus.success());
  }

  Future<void> signOut() async {
    await Get.find<SignOut>().call();
    change(null, status: RxStatus.empty());
    // TODO: NAVIGATE TO INITIAL SCREEN
    //Nav.rootRouter.navigate(NavDashboardRoute());
  }

  Future<Either<Failure, User>> logIn(LogInParams params) async {
    var result = await Get.find<LogIn>().call(params);
    loadUser();
    return result;
  }

  Future<Either<Failure, User>> signUp(SignUpParams params) async {
    var result = await Get.find<SignUp>().call(params);
    loadUser();
    return result;
  }

  Future<bool> isLoggedIn() async {
    print("CHECKING IF IT IS LOGGED IN");
    var result = await Get.find<IsLoggedIn>().call(NoParams());

    // print(
    //     "status: ${status.isError}\nSTATE: ${state?.email}\nLOGGED IN: ${result.isRight()}");

    // Load the user if it is logged in but got null
    if (result.isRight() &&
        state == null &&
        (status.isSuccess || status.isEmpty)) loadUser();

    return result.isRight();
  }
}
