import '../repositories/local_storage_repository.dart';

class PutStorageUseCase {
  final LocalStorageRepository localStorageRepository;

  PutStorageUseCase({
    required this.localStorageRepository,
  });

  Future<void> call(String key, List<String> value) async {
    try {
      await localStorageRepository.put(key, value);
    } catch (_) {
      rethrow;
    }
  }
}
