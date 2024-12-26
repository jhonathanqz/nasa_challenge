import 'package:nasa_challenge/app/modules/apod/domain/entities/apod_entity.dart';
import 'package:nasa_challenge/app/modules/apod/domain/repository/apod_remote_repository.dart';
import 'package:nasa_challenge/app/modules/apod/infra/contract/apod_remote_provider.dart';

class ApodRemoteRepositoryImpl implements ApodRemoteRepository {
  final ApodRemoteProvider _apodRemoteProvider;

  ApodRemoteRepositoryImpl({
    required ApodRemoteProvider apodRemoteProvider,
  }) : _apodRemoteProvider = apodRemoteProvider;

  @override
  Future<ApodEntity?> getApodDay() async {
    try {
      final response = await _apodRemoteProvider.getApodDay();
      if (response == null) {
        return null;
      }
      return ApodEntity.fromMap(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ApodEntity?> search({DateTime? date}) async {
    try {
      final response = await _apodRemoteProvider.search(date: date);
      if (response == null) {
        return null;
      }
      return ApodEntity.fromMap(response);
    } catch (e) {
      rethrow;
    }
  }
}
