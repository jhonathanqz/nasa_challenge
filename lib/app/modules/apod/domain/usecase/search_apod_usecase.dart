import 'package:nasa_challenge/app/core/domain/exceptions/api_exception.dart';
import 'package:nasa_challenge/app/core/domain/i_usecase.dart';
import 'package:nasa_challenge/app/modules/apod/domain/repository/apod_remote_repository.dart';

import '../entities/apod_entity.dart';

class SearchApodUsecase implements IUsecase<UsecaseResult<ApodEntity>, DateTime?> {
  final ApodRemoteRepository _apodRemoteRepository;

  SearchApodUsecase({
    required ApodRemoteRepository apodRemoteRepository,
  }) : _apodRemoteRepository = apodRemoteRepository;

  @override
  Future<UsecaseResult<ApodEntity>> call(DateTime? params) async {
    try {
      final response = await _apodRemoteRepository.search(date: params);
      if (response == null) {
        return UsecaseResult.error('Nenhum dado encontrado com os filtros informados.');
      }

      return UsecaseResult.success(response);
    } on ApiExceptions catch (e) {
      return UsecaseResult.error(e.message);
    } catch (e) {
      return UsecaseResult.error('Erro: $e');
    }
  }
}
