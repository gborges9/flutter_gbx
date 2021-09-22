import 'package:dartz/dartz.dart';
import 'package:farm_app/core/utils/either_extensions.dart';
import 'package:farm_app/core/utils/nav_utils.dart';
import 'package:farm_app/features/auth/domain/entities/user.dart';
import 'package:farm_app/features/auth/domain/usecases/log_in.dart';
import 'package:farm_app/features/auth/domain/usecases/sign_up.dart';
import 'package:farm_app/features/auth/presentation/controllers/user_controller.dart';
import 'package:flutter/material.dart' show TextEditingController;
import 'package:get/get.dart';

// TODO: CHANGE TO STATEMIXIN
// TODO: USE USERCONTROLLER TO SIGN IN
// TODO: CATCH USER WITHOUT DATA
class _Rx {
  final signIn = true.obs;
  final loading = false.obs;
}

class _TextControllers {
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final name = TextEditingController();
  final phone = TextEditingController();
  final cpf = TextEditingController();
}

// TODO: CHECK IF IT IS ALREADY LOGGED IN
// CASE: USER LOGGED IN AND GO TO LOGIN PAGE VIA URL
class AuthPageController extends GetxController {
  AuthPageController(this.onLoginSuccess);

  static AuthPageController get to => Get.find<AuthPageController>();

  final controllers = _TextControllers();
  final Function? onLoginSuccess;

  final _rx = _Rx();

  bool get signInMode => _rx.signIn.value;
  bool get loading => _rx.loading.value;

  Future createOrSignIn() async {
    _rx.loading.value = true;
    var userOrFailure = signInMode
        ? await UserController.to.logIn(
            LogInParams(controllers.email.text, controllers.password.text))
        : await UserController.to.signUp(SignUpParams(
            name: controllers.name.text,
            email: controllers.email.text,
            password: controllers.password.text,
            cpf: controllers.cpf.text,
            number: controllers.phone.text));
    _rx.loading.value = false;

    if (userOrFailure.isLeft())
      userOrFailure.showError();
    else {
      var user = (userOrFailure as Right).value as User;
      print("USER RECEIVED");
      Get.snackbar("LogIn Succeeded id: ${user.id}", "Email: ${user.email}");
      if (onLoginSuccess != null) {
        Nav.topRouter.popForced();
        onLoginSuccess?.call();
      } else {
        //TODO: NAVIGATE TO INITIAL SCREEN
        //Nav.rootRouter.navigate(NavDashboardRoute());
      }
    }
  }

  void switchMode() {
    _rx.signIn.value = !signInMode;
  }
}
