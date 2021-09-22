import 'package:farm_app/features/auth/domain/entities/user.dart';
import 'package:farm_app/features/auth/presentation/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef ProfileCallback = void Function(User user);

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key, this.onProfileClick}) : super(key: key);

  final ProfileCallback? onProfileClick;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      builder: (c) {
        var user = c.state;

        return InkWell(
          onTap: () {
            var u = c.state;
            if (u != null) onProfileClick?.call(u);
          },
          splashFactory: NoSplash.splashFactory,
          highlightColor: Theme.of(context).highlightColor,
          hoverColor: Theme.of(context).hoverColor,
          child: Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 24,
                  child: Text(getInitials(user?.name)),
                ),
                SizedBox(
                  width: 8,
                ),
                SizedBox(
                  width: 150,
                  child: user != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              getFirstLastName(user.name),
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            Text(
                              user.email,
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        )
                      : null,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String getInitials(String? name) {
    if (name == null) return " ";
    List<String> names = name.toUpperCase().split(" ");
    String initials = "";

    if (names.length == 0) return '';

    initials += names[0][0];
    if (names.length > 1) initials += names.last[0];

    return initials;
  }

  String getFirstLastName(String name) {
    var names = name.split(" ").map((e) => e.capitalizeFirst!).toList();

    if (names.length == 0) return " ";
    if (name.length == 1) return names.first;
    return "${names.first} ${names.last}";
  }
}
