import 'package:mobx/mobx.dart';
import 'package:nasa_challenge/app/core/domain/i_usecase.dart';
import 'package:nasa_challenge/app/modules/apod/domain/entities/apod_entity.dart';
import 'package:nasa_challenge/app/modules/apod/domain/usecase/get_apods_favorite_usecase.dart';
import 'package:nasa_challenge/app/modules/apod/domain/usecase/remove_apod_favorite_usecase.dart';
import 'package:nasa_challenge/app/modules/apod/domain/usecase/save_apod_favorite_usecase.dart';

part 'favorite_store.g.dart';

class FavoriteStore = FavoriteStoreBase with _$FavoriteStore;

abstract class FavoriteStoreBase with Store {
  final GetApodsFavoriteUsecase _getApodsFavoriteUsecase;
  final RemoveApodFavoriteUsecase _removeApodFavoriteUsecase;
  final SaveApodFavoriteUsecase _saveApodFavoriteUsecase;

  FavoriteStoreBase({
    required GetApodsFavoriteUsecase getApodsFavoriteUsecase,
    required RemoveApodFavoriteUsecase removeApodFavoriteUsecase,
    required SaveApodFavoriteUsecase saveApodFavoriteUsecase,
  })  : _getApodsFavoriteUsecase = getApodsFavoriteUsecase,
        _removeApodFavoriteUsecase = removeApodFavoriteUsecase,
        _saveApodFavoriteUsecase = saveApodFavoriteUsecase;

  @observable
  bool isLoading = false;

  @observable
  bool isError = false;

  @observable
  String? errorMessage;

  @action
  void wipeError() {
    isError = false;
    errorMessage = null;
  }

  @observable
  List<ApodEntity> favorites = [];

  @action
  Future<void> getAllFavorites() async {
    if (isLoading) return;
    wipeError();
    isLoading = true;
    favorites.clear();
    final result = await _getApodsFavoriteUsecase.call(NoParams());
    if (result.isError) {
      isError = true;
      errorMessage = result.error;
    }
    favorites.addAll(result.data ?? []);
    isLoading = false;
  }

  @action
  Future<bool> saveFavorite(ApodEntity apod) async {
    if (isLoading) return false;
    wipeError();
    final result = await _saveApodFavoriteUsecase.call(apod);
    if (result.isError) {
      isError = true;
      errorMessage = result.error;
      return false;
    }
    return true;
  }

  @action
  Future<bool> removeFavorite(ApodEntity apod) async {
    if (isLoading) return false;
    wipeError();
    final result = await _removeApodFavoriteUsecase.call(apod);
    if (result.isError) {
      isError = true;
      errorMessage = result.error;
      return false;
    }
    return true;
  }
}
