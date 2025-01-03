// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setup_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SetupStore on SetupStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'SetupStoreBase.isLoading', context: context);

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
      Atom(name: 'SetupStoreBase.isError', context: context);

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
      Atom(name: 'SetupStoreBase.errorMessage', context: context);

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

  late final _$saveUserAsyncAction =
      AsyncAction('SetupStoreBase.saveUser', context: context);

  @override
  Future<bool> saveUser({required String userName}) {
    return _$saveUserAsyncAction.run(() => super.saveUser(userName: userName));
  }

  late final _$SetupStoreBaseActionController =
      ActionController(name: 'SetupStoreBase', context: context);

  @override
  void wipeError() {
    final _$actionInfo = _$SetupStoreBaseActionController.startAction(
        name: 'SetupStoreBase.wipeError');
    try {
      return super.wipeError();
    } finally {
      _$SetupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isError: ${isError},
errorMessage: ${errorMessage}
    ''';
  }
}
