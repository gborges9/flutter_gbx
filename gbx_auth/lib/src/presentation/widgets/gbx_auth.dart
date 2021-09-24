import 'package:flutter/material.dart';
import 'package:gbx_auth/src/domain/entities/gbx_user.dart';

class GbxAuth<T extends GbxUser> extends StatelessWidget {
  const GbxAuth(
      {Key? key,
      required this.loginWidget,
      required this.signupWidget,
      required this.onLoginSuccess})
      : super(key: key);

  final WidgetBuilder loginWidget;
  final WidgetBuilder signupWidget;
  final void Function(T user) onLoginSuccess;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
