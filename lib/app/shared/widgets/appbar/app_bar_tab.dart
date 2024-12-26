import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import '../../style/style_theme.dart';

@immutable
class AppBarTab extends PreferredSize {
  AppBarTab({
    super.key,
    required String title,
    Widget? leading,
    Function? leadingOnTap,
    BuildContext? context,
    Widget? action,
    PreferredSizeWidget? bottom,
  }) : super(
          preferredSize: const Size.fromHeight(130),
          child: AppBar(
            backgroundColor: Style.theme.appBarColor,
            centerTitle: true,
            toolbarHeight: 130,
            elevation: 3.0,
            title: Text(
              title,
              style: Style.fieldStyle.medium16(
                textColor: Style.theme.white,
                fontWeight: FontWeight.normal,
              ),
            ),
            leading: leading ??
                GestureDetector(
                  child: Container(
                    margin: Style.edgeInsets.lsd,
                    padding: Style.edgeInsets.lsd,
                    decoration: BoxDecoration(
                      color: Style.theme.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Style.theme.buttonColor,
                      size: Style.size.size24,
                    ),
                  ),
                  onTap: () {
                    if (leadingOnTap != null) {
                      leadingOnTap();
                      return;
                    }
                    if (Modular.to.canPop()) {
                      Modular.to.pop();
                    }
                  },
                ),
            actions: [action ?? Container()],
            bottom: bottom,
          ),
        );
}
