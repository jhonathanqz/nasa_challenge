import 'package:nasa_challenge/app/modules/apod/domain/entities/apod_entity.dart';

abstract class ApodLocalRepository {
  Future<List<ApodEntity>> getAllFavorites();
  Future<bool> saveFavorite({
    required ApodEntity apodEntity,
  });
  Future<List<ApodEntity>> removeFavorite({
    required ApodEntity apodEntity,
  });
}
