import '../repositories/local_storage_repository.dart';

class DeleteStorageUseCase {
  final LocalStorageRepository localStorageRepository;

  DeleteStorageUseCase({
    required this.localStorageRepository,
  });

  Future<void> call(String key) async {
    try {
      await localStorageRepository.delete(key);
    } catch (_) {
      rethrow;
    }
  }
}
