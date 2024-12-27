import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_challenge/app/modules/apod/apod_module.dart';
import 'package:nasa_challenge/app/modules/apod/domain/entities/apod_entity.dart';
import 'package:nasa_challenge/app/modules/home/presentation/controller/apod_favorites_controller.dart';
import 'package:nasa_challenge/app/modules/home/presentation/controller/home_controller.dart';
import 'package:nasa_challenge/app/modules/home/presentation/pages/apod_details_page.dart';
import 'package:nasa_challenge/app/modules/home/presentation/pages/home_page.dart';
import 'package:nasa_challenge/app/modules/home/presentation/store/favorite_store.dart';
import 'package:nasa_challenge/app/modules/home/presentation/store/home_store.dart';

import '../localstorage/localstorage_module.dart';
import 'presentation/pages/favorites_page.dart';
import 'presentation/tab/home_tab.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        LocalstorageModule(),
        APODModule(),
      ];

  @override
  void binds(i) {
    i.addLazySingleton(
      () => HomeStore(
        getApodDayUsecase: i(),
        saveApodFavoriteUsecase: i(),
        removeApodFavoriteUsecase: i(),
        searchApodUsecase: i(),
        getApodsFavoriteUsecase: i(),
      ),
    );
    i.addLazySingleton(
      () => FavoriteStore(
        getApodsFavoriteUsecase: i(),
        removeApodFavoriteUsecase: i(),
        saveApodFavoriteUsecase: i(),
      ),
    );
    i.add(() => HomeController(homeStore: i()));
    i.add(() => ApodFavoritesController(favoriteStore: i()));
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => HomePage(
        controller: Modular.get(),
      ),
      children: [
        ChildRoute('/page1',
            child: (context) => HomeTab(
                  controller: Modular.get(),
                )),
        ChildRoute('/page2',
            child: (context) => FavoritesPage(
                  controller: Modular.get(),
                )),
      ],
    );

    r.child('/details',
        child: (context) => ApodDetailsPage(
              apodEntity: r.args.data as ApodEntity,
            ));
    r.child('/favorites',
        child: (context) => FavoritesPage(
              controller: Modular.get(),
            ));
    // r.wildcard(child: (context) => const PageNotFound());
  }
}
