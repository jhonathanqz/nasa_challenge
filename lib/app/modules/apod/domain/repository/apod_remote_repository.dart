import 'package:nasa_challenge/app/modules/apod/domain/entities/apod_entity.dart';

abstract class ApodRemoteRepository {
  Future<ApodEntity?> getApodDay();
  Future<ApodEntity?> search({
    DateTime? date,
  });
}
