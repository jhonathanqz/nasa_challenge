import 'package:nasa_challenge/app/core/domain/i_usecase.dart';
import 'package:nasa_challenge/app/modules/apod/domain/repository/apod_local_repository.dart';

import '../entities/apod_entity.dart';

class RemoveApodFavoriteUsecase implements IUsecase<UsecaseResult<List<ApodEntity>>, ApodEntity> {
  final ApodLocalRepository _apodLocalRepository;

  RemoveApodFavoriteUsecase({
    required ApodLocalRepository apodLocalRepository,
  }) : _apodLocalRepository = apodLocalRepository;

  @override
  Future<UsecaseResult<List<ApodEntity>>> call(ApodEntity params) async {
    try {
      final response = await _apodLocalRepository.removeFavorite(apodEntity: params);

      return UsecaseResult.success(response);
    } catch (e) {
      return UsecaseResult.error('Erro: $e');
    }
  }
}
