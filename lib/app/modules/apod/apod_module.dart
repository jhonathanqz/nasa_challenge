import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_challenge/app/core/client/client_helper.dart';
import 'package:nasa_challenge/app/modules/apod/data/apod_local_provider_impl.dart';
import 'package:nasa_challenge/app/modules/apod/data/apod_remote_provider_impl.dart';
import 'package:nasa_challenge/app/modules/apod/domain/repository/apod_local_repository.dart';
import 'package:nasa_challenge/app/modules/apod/domain/repository/apod_remote_repository.dart';
import 'package:nasa_challenge/app/modules/apod/domain/usecase/get_apod_day_usecase.dart';
import 'package:nasa_challenge/app/modules/apod/domain/usecase/get_apods_favorite_usecase.dart';
import 'package:nasa_challenge/app/modules/apod/domain/usecase/remove_apod_favorite_usecase.dart';
import 'package:nasa_challenge/app/modules/apod/domain/usecase/save_apod_favorite_usecase.dart';
import 'package:nasa_challenge/app/modules/apod/domain/usecase/search_apod_usecase.dart';
import 'package:nasa_challenge/app/modules/apod/infra/apod_local_repository_impl.dart';
import 'package:nasa_challenge/app/modules/apod/infra/apod_remote_repository_impl.dart';
import 'package:nasa_challenge/app/modules/apod/infra/contract/apod_local_provider.dart';
import 'package:nasa_challenge/app/modules/apod/infra/contract/apod_remote_provider.dart';

import '../localstorage/localstorage_module.dart';

class APODModule extends Module {
  @override
  List<Module> get imports => [
        LocalstorageModule(),
      ];

  @override
  void exportedBinds(i) {
    i.add<ApodRemoteProvider>(() => ApodRemoteProviderImpl(client: ClientHelper.getClientBase()));
    i.add<ApodLocalProvider>(() => ApodLocalProviderImpl(dbStore: i()));
    i.add<ApodRemoteRepository>(() => ApodRemoteRepositoryImpl(apodRemoteProvider: i()));
    i.add<ApodLocalRepository>(() => ApodLocalRepositoryImpl(apodLocalProvider: i()));
    i.add(() => GetApodDayUsecase(apodRemoteRepository: i()));
    i.add(() => GetApodsFavoriteUsecase(apodLocalRepository: i()));
    i.add(() => RemoveApodFavoriteUsecase(apodLocalRepository: i()));
    i.add(() => SaveApodFavoriteUsecase(apodLocalRepository: i()));
    i.add(() => SearchApodUsecase(apodRemoteRepository: i()));
  }
}
