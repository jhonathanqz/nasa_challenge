import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_challenge/app/modules/setup/setup_module.dart';

import 'app.dart';

import 'modules/home/home_module.dart';
import 'modules/localstorage/localstorage_module.dart';
import 'modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        LocalstorageModule(),
      ];

  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.module('/splash', module: SplashModule());
    r.module('/setup', module: SetupModule());
    r.module('/home', module: HomeModule());

    // r.wildcard(child: (context) => const PageNotFound());
  }

  @override
  // ignore: override_on_non_overriding_member
  Widget get bootstrap => const App();
}
