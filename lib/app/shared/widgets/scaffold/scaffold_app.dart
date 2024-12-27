import 'package:flutter/material.dart';

import '../../style/style_theme.dart';
import '../loading/loading.dart';

class ScaffoldApp extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final Widget? header;
  final Widget? footer;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Key? scaffoldKey;
  final bool isonPopInvoked;
  final Widget? bottomNavigationBar;

  const ScaffoldApp({
    super.key,
    this.appBar,
    required this.child,
    this.isLoading = false,
    this.header,
    this.footer,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.drawer,
    this.scaffoldKey,
    this.isonPopInvoked = false,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: appBar,
        drawer: drawer,
        floatingActionButton: floatingActionButton ?? Container(),
        floatingActionButtonLocation: floatingActionButtonLocation ?? FloatingActionButtonLocation.endFloat,
        backgroundColor: Style.theme.background,
        bottomNavigationBar: bottomNavigationBar,
        body: Loading(
          isLoading: isLoading,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header ?? Container(),
              Expanded(child: child),
              footer ?? Container(),
            ],
          ),
        ),
      ),
    );
  }
}
