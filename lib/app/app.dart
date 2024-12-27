import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'shared/style/style_theme.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/splash/');
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return MaterialApp.router(
      title: 'Nasa Challenge',
      theme: materialThemeData,
      debugShowCheckedModeBanner: false,
      routerConfig: Modular.routerConfig,
    );
  }

  static ThemeData get materialThemeData => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Style.theme.primaryColor,
        buttonTheme: ButtonThemeData(
          buttonColor: Style.theme.buttonColor,
          textTheme: ButtonTextTheme.primary,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}
