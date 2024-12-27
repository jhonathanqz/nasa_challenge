// Mocks generated by Mockito 5.4.5 from annotations
// in nasa_challenge/test/modules/apod/domain/usecase/remove_apod_favorite_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:nasa_challenge/app/modules/apod/domain/entities/apod_entity.dart'
    as _i4;
import 'package:nasa_challenge/app/modules/apod/domain/repository/apod_local_repository.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [ApodLocalRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockApodLocalRepository extends _i1.Mock
    implements _i2.ApodLocalRepository {
  MockApodLocalRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.ApodEntity>> getAllFavorites() => (super.noSuchMethod(
        Invocation.method(
          #getAllFavorites,
          [],
        ),
        returnValue: _i3.Future<List<_i4.ApodEntity>>.value(<_i4.ApodEntity>[]),
      ) as _i3.Future<List<_i4.ApodEntity>>);

  @override
  _i3.Future<bool> saveFavorite({required _i4.ApodEntity? apodEntity}) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveFavorite,
          [],
          {#apodEntity: apodEntity},
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<List<_i4.ApodEntity>> removeFavorite(
          {required _i4.ApodEntity? apodEntity}) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeFavorite,
          [],
          {#apodEntity: apodEntity},
        ),
        returnValue: _i3.Future<List<_i4.ApodEntity>>.value(<_i4.ApodEntity>[]),
      ) as _i3.Future<List<_i4.ApodEntity>>);
}
