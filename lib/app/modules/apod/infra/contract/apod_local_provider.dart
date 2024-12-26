import '../../domain/entities/apod_entity.dart';

abstract class ApodLocalProvider {
  Future<List<String>> getAllFavorites();
  Future<bool> saveFavorite({
    required ApodEntity apodEntity,
  });
  Future<List<String>> removeFavorite({
    required ApodEntity apodEntity,
  });
}
