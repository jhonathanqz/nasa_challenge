import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import '../../style/style_theme.dart';

@immutable
class AppBarDefault extends PreferredSize {
  AppBarDefault({
    super.key,
    String? title,
    Widget? leading,
    Function? leadingOnTap,
    BuildContext? context,
    Widget? action,
    PreferredSizeWidget? bottom,
    bool isLeading = true,
    Color? background,
  }) : super(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
            key: key,
            backgroundColor: background ?? Style.theme.appBarColor,
            centerTitle: true,
            toolbarHeight: 70,
            elevation: 3.0,
            title: Text(
              title ?? '',
              style: Style.fieldStyle.medium16(
                textColor: Style.theme.white,
                fontWeight: FontWeight.normal,
              ),
            ),
            leading: isLeading
                ? leading ??
                    GestureDetector(
                      child: Container(
                        margin: Style.edgeInsets.lsd,
                        padding: Style.edgeInsets.lsd,
                        decoration: BoxDecoration(
                          // ignore: deprecated_member_use
                          color: Style.theme.white.withOpacity(0.9),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Style.theme.buttonColor,
                          size: Style.size.size25,
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
                    )
                : null,
            actions: [action ?? Container()],
            bottom: bottom,
          ),
        );
}
