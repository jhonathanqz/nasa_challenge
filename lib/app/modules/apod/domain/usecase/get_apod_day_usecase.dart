import 'package:nasa_challenge/app/core/domain/exceptions/api_exception.dart';
import 'package:nasa_challenge/app/core/domain/i_usecase.dart';
import 'package:nasa_challenge/app/modules/apod/domain/entities/apod_entity.dart';
import 'package:nasa_challenge/app/modules/apod/domain/repository/apod_remote_repository.dart';

class GetApodDayUsecase implements IUsecase<UsecaseResult<ApodEntity>, NoParams> {
  final ApodRemoteRepository _apodRemoteRepository;

  GetApodDayUsecase({
    required ApodRemoteRepository apodRemoteRepository,
  }) : _apodRemoteRepository = apodRemoteRepository;

  @override
  Future<UsecaseResult<ApodEntity>> call(NoParams params) async {
    try {
      final response = await _apodRemoteRepository.getApodDay();
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
