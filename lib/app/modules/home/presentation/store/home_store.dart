import 'package:mobx/mobx.dart';
import 'package:nasa_challenge/app/core/domain/i_usecase.dart';
import 'package:nasa_challenge/app/modules/apod/domain/usecase/get_apod_day_usecase.dart';
import 'package:nasa_challenge/app/modules/apod/domain/usecase/get_apods_favorite_usecase.dart';
import 'package:nasa_challenge/app/modules/apod/domain/usecase/remove_apod_favorite_usecase.dart';
import 'package:nasa_challenge/app/modules/apod/domain/usecase/save_apod_favorite_usecase.dart';
import 'package:nasa_challenge/app/modules/apod/domain/usecase/search_apod_usecase.dart';

import '../../../apod/domain/entities/apod_entity.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final GetApodDayUsecase _getApodDayUsecase;
  final SaveApodFavoriteUsecase _saveApodFavoriteUsecase;
  final RemoveApodFavoriteUsecase _removeApodFavoriteUsecase;
  final SearchApodUsecase _searchApodUsecase;
  final GetApodsFavoriteUsecase _getApodsFavoriteUsecase;

  HomeStoreBase({
    required GetApodDayUsecase getApodDayUsecase,
    required SaveApodFavoriteUsecase saveApodFavoriteUsecase,
    required RemoveApodFavoriteUsecase removeApodFavoriteUsecase,
    required SearchApodUsecase searchApodUsecase,
    required GetApodsFavoriteUsecase getApodsFavoriteUsecase,
  })  : _getApodDayUsecase = getApodDayUsecase,
        _saveApodFavoriteUsecase = saveApodFavoriteUsecase,
        _removeApodFavoriteUsecase = removeApodFavoriteUsecase,
        _searchApodUsecase = searchApodUsecase,
        _getApodsFavoriteUsecase = getApodsFavoriteUsecase;

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
  bool isHightQuality = false;

  @action
  void setHightQuality(bool value) {
    isHightQuality = value;
  }

  @observable
  ApodEntity? apodEntity;

  @action
  Future<ApodEntity?> getApodDay() async {
    if (isLoading) return null;
    wipeError();
    isLoading = true;
    final result = await _getApodDayUsecase.call(NoParams());
    apodEntity = result.data;

    if (result.isSuccess) {
      await _checkFavorite(result.data!);
    }

    if (result.isError) {
      isError = true;
      errorMessage = result.error;
    }
    isLoading = false;

    return result.data;
  }

  @action
  Future<ApodEntity?> search({required DateTime date}) async {
    if (isLoading) return null;
    wipeError();
    isLoading = true;
    final result = await _searchApodUsecase.call(date);
    if (result.isError) {
      isError = true;
      errorMessage = result.error;
    }
    isLoading = false;
    apodEntity = result.data;
    return result.data;
  }

  @action
  Future<bool> saveApodFavorite(ApodEntity apod) async {
    if (isLoading) return false;
    wipeError();
    isLoading = true;
    final apodFavorite = apod.copyWith(isFavorite: true);
    final result = await _saveApodFavoriteUsecase.call(apodFavorite);
    if (result.isError) {
      isError = true;
      errorMessage = result.error;
    }

    if (result.isSuccess) {
      apodEntity = apodEntity?.copyWith(isFavorite: true);
    }
    isLoading = false;
    return result.data ?? false;
  }

  @action
  Future<bool> removeApodFavorite(ApodEntity apod) async {
    if (isLoading) return false;
    wipeError();
    isLoading = true;
    final result = await _removeApodFavoriteUsecase.call(apod);
    isLoading = false;
    if (result.isError) {
      isError = true;
      errorMessage = result.error;
    }

    if (result.isSuccess) {
      apodEntity = apodEntity?.copyWith(isFavorite: false);
    }
    return result.isSuccess;
  }

  @action
  Future<void> _checkFavorite(ApodEntity result) async {
    final favoritesDatabase = await _getApodsFavoriteUsecase.call(NoParams());
    if (favoritesDatabase.isSuccess && favoritesDatabase.data!.isNotEmpty) {
      final favorite = favoritesDatabase.data!.where((e) => e.url == result.url);
      if (favorite.isNotEmpty) {
        apodEntity = apodEntity?.copyWith(isFavorite: true);
      }
    }
  }

  @action
  void wipeStore() {
    apodEntity = null;
    isLoading = false;
    wipeError();
  }
}
