import 'package:nasa_challenge/app/modules/apod/domain/entities/apod_entity.dart';
import 'package:nasa_challenge/app/modules/apod/infra/contract/apod_local_provider.dart';
import 'package:nasa_challenge/app/modules/localstorage/presentation/mobx/db.store.dart';

class ApodLocalProviderImpl implements ApodLocalProvider {
  final DBStore _dbStore;

  ApodLocalProviderImpl({
    required DBStore dbStore,
  }) : _dbStore = dbStore;

  @override
  Future<List<String>> getAllFavorites() async {
    try {
      final favorites = await _dbStore.get('apod_key');
      return favorites;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<String>> removeFavorite({
    required ApodEntity apodEntity,
  }) async {
    try {
      final favoritesDatabase = await _dbStore.get('apod_key');

      final jsonApod = apodEntity.toJson();
      if (!favoritesDatabase.contains(jsonApod)) {
        return favoritesDatabase;
      }

      favoritesDatabase.remove(jsonApod);
      await _dbStore.put('apod_key', favoritesDatabase);

      return favoritesDatabase;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> saveFavorite({required ApodEntity apodEntity}) async {
    try {
      final favoritesDatabase = await _dbStore.get('apod_key');
      final jsonApod = apodEntity.toJson();
      if (favoritesDatabase.isNotEmpty && favoritesDatabase.contains(jsonApod)) {
        return true;
      }
      favoritesDatabase.add(jsonApod);
      await _dbStore.put('apod_key', favoritesDatabase);

      return true;
    } catch (e) {
      rethrow;
    }
  }
}
