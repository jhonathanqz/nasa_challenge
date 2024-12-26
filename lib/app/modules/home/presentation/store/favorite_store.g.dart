// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoriteStore on FavoriteStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'FavoriteStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isErrorAtom =
      Atom(name: 'FavoriteStoreBase.isError', context: context);

  @override
  bool get isError {
    _$isErrorAtom.reportRead();
    return super.isError;
  }

  @override
  set isError(bool value) {
    _$isErrorAtom.reportWrite(value, super.isError, () {
      super.isError = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'FavoriteStoreBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$favoritesAtom =
      Atom(name: 'FavoriteStoreBase.favorites', context: context);

  @override
  List<ApodEntity> get favorites {
    _$favoritesAtom.reportRead();
    return super.favorites;
  }

  @override
  set favorites(List<ApodEntity> value) {
    _$favoritesAtom.reportWrite(value, super.favorites, () {
      super.favorites = value;
    });
  }

  late final _$getAllFavoritesAsyncAction =
      AsyncAction('FavoriteStoreBase.getAllFavorites', context: context);

  @override
  Future<void> getAllFavorites() {
    return _$getAllFavoritesAsyncAction.run(() => super.getAllFavorites());
  }

  late final _$saveFavoriteAsyncAction =
      AsyncAction('FavoriteStoreBase.saveFavorite', context: context);

  @override
  Future<bool> saveFavorite(ApodEntity apod) {
    return _$saveFavoriteAsyncAction.run(() => super.saveFavorite(apod));
  }

  late final _$removeFavoriteAsyncAction =
      AsyncAction('FavoriteStoreBase.removeFavorite', context: context);

  @override
  Future<bool> removeFavorite(ApodEntity apod) {
    return _$removeFavoriteAsyncAction.run(() => super.removeFavorite(apod));
  }

  late final _$FavoriteStoreBaseActionController =
      ActionController(name: 'FavoriteStoreBase', context: context);

  @override
  void wipeError() {
    final _$actionInfo = _$FavoriteStoreBaseActionController.startAction(
        name: 'FavoriteStoreBase.wipeError');
    try {
      return super.wipeError();
    } finally {
      _$FavoriteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isError: ${isError},
errorMessage: ${errorMessage},
favorites: ${favorites}
    ''';
  }
}
