import 'package:flutter/material.dart';

import '../../style/style_theme.dart';

@immutable
class AppBarWidget extends PreferredSize {
  AppBarWidget({
    super.key,
    required String title,
    Widget? leading,
    Function? leadingOnTap,
    BuildContext? context,
    required Widget widget,
    PreferredSizeWidget? bottom,
  }) : super(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: AppBar(
            backgroundColor: Style.theme.appBarColor,
            title: Text(
              title,
              style: TextStyle(
                color: Style.theme.lightTextColor,
                fontSize: 18,
              ),
            ),
            centerTitle: true,
            leading: leading,
            actions: [widget],
            bottom: bottom,
          ),
        );
}
