import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_challenge/app/modules/apod/domain/entities/apod_entity.dart';

import '../store/favorite_store.dart';

class ApodFavoritesController {
  final FavoriteStore _favoriteStore;

  ApodFavoritesController({
    required FavoriteStore favoriteStore,
  }) : _favoriteStore = favoriteStore;

  FavoriteStore get favoriteStore => _favoriteStore;

  void getAllFavorites() => _favoriteStore.getAllFavorites();

  void saveFavorite(ApodEntity apod) async {
    if (apod.isFavorite) {
      removeFavorite(apod);
      return;
    }
    await _favoriteStore.saveFavorite(apod);
    getAllFavorites();
  }

  void removeFavorite(ApodEntity apod) async {
    if (!apod.isFavorite) return;
    await _favoriteStore.removeFavorite(apod);
    getAllFavorites();
  }

  void navigateToDetails(ApodEntity apod) => Modular.to.pushNamed('./details', arguments: apod);

  void dispose() => _favoriteStore.wipeStore();
}
