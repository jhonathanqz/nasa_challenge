import 'package:nasa_challenge/app/core/domain/i_usecase.dart';
import 'package:nasa_challenge/app/modules/apod/domain/repository/apod_local_repository.dart';

import '../entities/apod_entity.dart';

class GetApodsFavoriteUsecase implements IUsecase<UsecaseResult<List<ApodEntity>>, NoParams> {
  final ApodLocalRepository _apodLocalRepository;

  GetApodsFavoriteUsecase({
    required ApodLocalRepository apodLocalRepository,
  }) : _apodLocalRepository = apodLocalRepository;

  @override
  Future<UsecaseResult<List<ApodEntity>>> call(NoParams params) async {
    try {
      final response = await _apodLocalRepository.getAllFavorites();
      if (response.isEmpty) {
        return UsecaseResult.error('Nenhum favorito foi encontrado.');
      }
      return UsecaseResult.success(response);
    } catch (e) {
      return UsecaseResult.error('Erro: $e');
    }
  }
}
