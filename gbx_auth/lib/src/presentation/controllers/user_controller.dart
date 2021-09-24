import 'package:dartz/dartz.dart';
import 'package:gbx_auth/src/domain/entities/gbx_user.dart';

import 'package:get/get.dart';

//class UserController<T extends GbxUser> extends GetxController
//    with StateMixin<T> {
//  static UserController get to => Get.find<UserController>();
//
//  @override
//  void onReady() {
//    super.onReady();
//    loadUser(false);
//  }
//
//  Future<void> loadUser([bool forceRefresh = true]) async {
//    print("Loading user!");
//    change(state, status: RxStatus.loading());
//
//    var result = await Get.find<GetCurrentUser>().call(forceRefresh);
//
//    if (result.isLeft()) {
//      print(result.left);
//
//      return change(null, status: RxStatus.error(result.left.message));
//    }
//
//    change(result.right, status: RxStatus.success());
//  }
//
//  Future<void> signOut() async {
//    await Get.find<SignOut>().call();
//    change(null, status: RxStatus.empty());
//    // TODO: NAVIGATE TO INITIAL SCREEN
//    //Nav.rootRouter.navigate(NavDashboardRoute());
//  }
//
//  Future<Either<Failure, User>> logIn(LogInParams params) async {
//    var result = await Get.find<LogIn>().call(params);
//    loadUser();
//    return result;
//  }
//
//  Future<Either<Failure, User>> signUp(SignUpParams params) async {
//    var result = await Get.find<SignUp>().call(params);
//    loadUser();
//    return result;
//  }
//
//  Future<bool> isLoggedIn() async {
//    print("CHECKING IF IT IS LOGGED IN");
//    var result = await Get.find<IsLoggedIn>().call(NoParams());
//
//    // print(
//    //     "status: ${status.isError}\nSTATE: ${state?.email}\nLOGGED IN: ${result.isRight()}");
//
//    // Load the user if it is logged in but got null
//    if (result.isRight() &&
//        state == null &&
//        (status.isSuccess || status.isEmpty)) loadUser();
//
//    return result.isRight();
//  }
//}
//