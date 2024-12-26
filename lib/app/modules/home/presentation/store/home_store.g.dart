// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'HomeStoreBase.isLoading', context: context);

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
      Atom(name: 'HomeStoreBase.isError', context: context);

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
      Atom(name: 'HomeStoreBase.errorMessage', context: context);

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

  late final _$isHightQualityAtom =
      Atom(name: 'HomeStoreBase.isHightQuality', context: context);

  @override
  bool get isHightQuality {
    _$isHightQualityAtom.reportRead();
    return super.isHightQuality;
  }

  @override
  set isHightQuality(bool value) {
    _$isHightQualityAtom.reportWrite(value, super.isHightQuality, () {
      super.isHightQuality = value;
    });
  }

  late final _$apodEntityAtom =
      Atom(name: 'HomeStoreBase.apodEntity', context: context);

  @override
  ApodEntity? get apodEntity {
    _$apodEntityAtom.reportRead();
    return super.apodEntity;
  }

  @override
  set apodEntity(ApodEntity? value) {
    _$apodEntityAtom.reportWrite(value, super.apodEntity, () {
      super.apodEntity = value;
    });
  }

  late final _$getApodDayAsyncAction =
      AsyncAction('HomeStoreBase.getApodDay', context: context);

  @override
  Future<ApodEntity?> getApodDay() {
    return _$getApodDayAsyncAction.run(() => super.getApodDay());
  }

  late final _$searchAsyncAction =
      AsyncAction('HomeStoreBase.search', context: context);

  @override
  Future<ApodEntity?> search({required DateTime date}) {
    return _$searchAsyncAction.run(() => super.search(date: date));
  }

  late final _$saveApodFavoriteAsyncAction =
      AsyncAction('HomeStoreBase.saveApodFavorite', context: context);

  @override
  Future<bool> saveApodFavorite(ApodEntity apod) {
    return _$saveApodFavoriteAsyncAction
        .run(() => super.saveApodFavorite(apod));
  }

  late final _$removeApodFavoriteAsyncAction =
      AsyncAction('HomeStoreBase.removeApodFavorite', context: context);

  @override
  Future<bool> removeApodFavorite(ApodEntity apod) {
    return _$removeApodFavoriteAsyncAction
        .run(() => super.removeApodFavorite(apod));
  }

  late final _$_checkFavoriteAsyncAction =
      AsyncAction('HomeStoreBase._checkFavorite', context: context);

  @override
  Future<void> _checkFavorite(ApodEntity result) {
    return _$_checkFavoriteAsyncAction.run(() => super._checkFavorite(result));
  }

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  void wipeError() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.wipeError');
    try {
      return super.wipeError();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHightQuality(bool value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setHightQuality');
    try {
      return super.setHightQuality(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void wipeStore() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.wipeStore');
    try {
      return super.wipeStore();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isError: ${isError},
errorMessage: ${errorMessage},
isHightQuality: ${isHightQuality},
apodEntity: ${apodEntity}
    ''';
  }
}
