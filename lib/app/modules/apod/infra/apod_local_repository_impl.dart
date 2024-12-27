import 'package:nasa_challenge/app/modules/apod/domain/entities/apod_entity.dart';
import 'package:nasa_challenge/app/modules/apod/domain/repository/apod_local_repository.dart';
import 'package:nasa_challenge/app/modules/apod/infra/contract/apod_local_provider.dart';

class ApodLocalRepositoryImpl implements ApodLocalRepository {
  final ApodLocalProvider _apodLocalProvider;

  ApodLocalRepositoryImpl({
    required ApodLocalProvider apodLocalProvider,
  }) : _apodLocalProvider = apodLocalProvider;

  @override
  Future<List<ApodEntity>> getAllFavorites() async {
    try {
      final response = await _apodLocalProvider.getAllFavorites();
      if (response.isEmpty) {
        return [];
      }
      return response.map((e) => ApodEntity.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ApodEntity>> removeFavorite({required ApodEntity apodEntity}) async {
    try {
      final response = await _apodLocalProvider.removeFavorite(apodEntity: apodEntity);
      if (response.isEmpty) {
        return [];
      }

      return response.map((e) => ApodEntity.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> saveFavorite({required ApodEntity apodEntity}) {
    try {
      final response = _apodLocalProvider.saveFavorite(apodEntity: apodEntity);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
