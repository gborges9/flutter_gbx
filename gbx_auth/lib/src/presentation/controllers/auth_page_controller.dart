import 'package:flutter/material.dart' show TextEditingController;
import 'package:gbx_auth/src/auth_module.dart';
import 'package:gbx_auth/src/domain/entities/gbx_user.dart';
import 'package:gbx_core/gbx_core.dart';
import 'package:get/get.dart';

//TODO: 
//class _TextControllers {
//  final email = TextEditingController();
//  final password = TextEditingController();
//  final confirmPassword = TextEditingController();
//  final name = TextEditingController();
//}
//
//class AuthPageController<T extends GbxUser> extends GetxController
//    with StateMixin<GbxUser> {
//  AuthPageController(this.onLoginSuccess);
//
//  static AuthPageController get to => Get.find<AuthPageController>();
//
//  final controllers = _TextControllers();
//  final Function? onLoginSuccess;
//
//  bool logInMode = true;
//
//  Future logIn() async { // TODO: CALLBACK ON SUCCESS
//    return loadContent(
//      () => AuthModule<GbxUser>().logIn(
//        LogInParams(controllers.email.text, controllers.password.text),
//      ),
//    );
//  }
//
//  Future signUp() async {
//    // TODO: REQUEST A FUNCTION TO BUILD THE USER
//    return AuthModule().signUp(SignUpParams(user: user, password: password))
//  }
//
//  void switchMode() {
//    logInMode = !logInMode;
//    update();
//  }
//}
