import 'package:flutter/material.dart';

class NoOverscrollEffect extends StatelessWidget {
  const NoOverscrollEffect({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overscroll) {
        overscroll.disallowIndicator();
        return false;
      },
      child: child,
    );
  }
}
