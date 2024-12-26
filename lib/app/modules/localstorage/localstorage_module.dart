import 'package:flutter_modular/flutter_modular.dart';

import 'data/provider/local_storage_provider_impl.dart';
import 'domain/repositories/local_storage_repository.dart';
import 'domain/usecase/add_storage_use_case.dart';
import 'domain/usecase/delete_storage_use_case.dart';
import 'domain/usecase/get_storage_use_case.dart';
import 'domain/usecase/put_storage_use_case.dart';
import 'infrastructure/contract/local_storage_provider.dart';
import 'infrastructure/repositories/local_storage_repository_impl.dart';
import 'presentation/mobx/db.store.dart';

class LocalstorageModule extends Module {
  @override
  void exportedBinds(i) {
    i.addLazySingleton<LocalStorageProvider>(
      () => LocalStorageProviderImpl(),
    );

    i.add<LocalStorageRepository>(
      () => LocalStorageRepositoryImpl(
        localStorageProvider: i<LocalStorageProvider>(),
      ),
    );

    i.add<AddStorageUseCase>(
      () => AddStorageUseCase(
        localStorageRepository: i<LocalStorageRepository>(),
      ),
    );
    i.add<DeleteStorageUseCase>(
      () => DeleteStorageUseCase(
        localStorageRepository: i<LocalStorageRepository>(),
      ),
    );
    i.add<GetStorageUseCase>(
      () => GetStorageUseCase(
        localStorageRepository: i<LocalStorageRepository>(),
      ),
    );
    i.add<PutStorageUseCase>(
      () => PutStorageUseCase(
        localStorageRepository: i<LocalStorageRepository>(),
      ),
    );
    i.addSingleton(
      () => DBStore(
        addStorageUseCase: i<AddStorageUseCase>(),
        getStorageUseCase: i<GetStorageUseCase>(),
        deleteStorageUseCase: i<DeleteStorageUseCase>(),
        putStorageUseCase: i<PutStorageUseCase>(),
      ),
    );
  }

  @override
  void routes(r) {}
}
