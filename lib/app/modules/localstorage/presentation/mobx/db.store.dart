import 'package:flutter/foundation.dart';

import '../../domain/usecase/add_storage_use_case.dart';
import '../../domain/usecase/delete_storage_use_case.dart';
import '../../domain/usecase/get_storage_use_case.dart';
import '../../domain/usecase/put_storage_use_case.dart';

class DBStore {
  final AddStorageUseCase addStorageUseCase;
  final DeleteStorageUseCase deleteStorageUseCase;
  final GetStorageUseCase getStorageUseCase;
  final PutStorageUseCase putStorageUseCase;

  DBStore({
    required this.addStorageUseCase,
    required this.deleteStorageUseCase,
    required this.getStorageUseCase,
    required this.putStorageUseCase,
  });

  Future<void> insert(String key, List<String> value) async {
    try {
      await addStorageUseCase.call(key, value);
    } catch (_) {}
  }

  Future<void> delete(String key) async {
    try {
      await deleteStorageUseCase.call(key);
    } catch (_) {}
  }

  Future<void> put(String key, List<String> value) async {
    try {
      await putStorageUseCase.call(key, value);
    } catch (e) {
      debugPrint('***Erro hive: $e');
    }
  }

  Future<List<String>> get(String key) async {
    try {
      final response = await getStorageUseCase.call(key);
      return response;
    } catch (_) {}

    return [];
  }
}
