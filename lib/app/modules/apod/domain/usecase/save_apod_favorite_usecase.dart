import 'package:nasa_challenge/app/core/domain/i_usecase.dart';
import 'package:nasa_challenge/app/modules/apod/domain/repository/apod_local_repository.dart';

import '../entities/apod_entity.dart';

class SaveApodFavoriteUsecase implements IUsecase<UsecaseResult<bool>, ApodEntity> {
  final ApodLocalRepository _apodLocalRepository;

  SaveApodFavoriteUsecase({
    required ApodLocalRepository apodLocalRepository,
  }) : _apodLocalRepository = apodLocalRepository;

  @override
  Future<UsecaseResult<bool>> call(ApodEntity params) async {
    try {
      final apod = params.copyWith(isFavorite: true);
      final response = await _apodLocalRepository.saveFavorite(apodEntity: apod);
      return UsecaseResult.success(response);
    } catch (e) {
      return UsecaseResult.error('Erro: $e');
    }
  }
}
