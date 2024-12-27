import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_challenge/app/modules/splash/presentation/controller/splash_controller.dart';
import 'package:nasa_challenge/app/modules/splash/presentation/pages/splash_page.dart';

import '../localstorage/localstorage_module.dart';

class SplashModule extends Module {
  @override
  List<Module> get imports => [
        LocalstorageModule(),
      ];

  @override
  void binds(i) {
    i.add(() => SplashController(dbStore: i()));
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => SplashPage(controller: Modular.get()));
    // r.wildcard(child: (context) => const PageNotFound());
  }
}
