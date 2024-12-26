import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_challenge/app/modules/setup/presentation/controller/setup_controller.dart';
import 'package:nasa_challenge/app/modules/setup/presentation/pages/setup_page.dart';
import 'package:nasa_challenge/app/modules/setup/presentation/store/setup_store.dart';

import '../localstorage/localstorage_module.dart';

class SetupModule extends Module {
  @override
  List<Module> get imports => [
        LocalstorageModule(),
      ];

  @override
  void binds(i) {
    i.add(() => SetupStore(dbStore: i()));
    i.add(() => SetupController(store: i()));
  }

  @override
  void routes(r) {
    r.child('/',
        child: (context) => SetupPage(
              controller: Modular.get(),
            ));
  }
}
