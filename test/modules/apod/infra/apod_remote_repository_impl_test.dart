import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nasa_challenge/app/modules/apod/domain/entities/apod_entity.dart';
import 'package:nasa_challenge/app/modules/apod/infra/apod_remote_repository_impl.dart';
import 'package:nasa_challenge/app/modules/apod/infra/contract/apod_remote_provider.dart';

import 'mocks/apod_remote_repository_impl_test.mocks.dart';

@GenerateMocks([ApodRemoteProvider])
void main() {
  late ApodRemoteRepositoryImpl repository;
  late MockApodRemoteProvider mockApodRemoteProvider;

  setUp(() {
    mockApodRemoteProvider = MockApodRemoteProvider();
    repository = ApodRemoteRepositoryImpl(apodRemoteProvider: mockApodRemoteProvider);
  });

  group('getApodDay', () {
    final apodMap = {'title': 'Test Title', 'url': 'http://example.com'};
    final apodEntity = ApodEntity.fromMap(apodMap);

    test('should return ApodEntity when the call to remote provider is successful', () async {
      when(mockApodRemoteProvider.getApodDay()).thenAnswer((_) async => apodMap);

      final result = await repository.getApodDay();

      expect(result, equals(apodEntity));
      verify(mockApodRemoteProvider.getApodDay());
      verifyNoMoreInteractions(mockApodRemoteProvider);
    });

    test('should return null when the call to remote provider returns null', () async {
      when(mockApodRemoteProvider.getApodDay()).thenAnswer((_) async => null);

      final result = await repository.getApodDay();

      expect(result, isNull);
      verify(mockApodRemoteProvider.getApodDay());
      verifyNoMoreInteractions(mockApodRemoteProvider);
    });

    test('should throw an exception when the call to remote provider throws an exception', () async {
      when(mockApodRemoteProvider.getApodDay()).thenThrow(Exception('Error'));

      expect(() => repository.getApodDay(), throwsA(isA<Exception>()));
      verify(mockApodRemoteProvider.getApodDay());
      verifyNoMoreInteractions(mockApodRemoteProvider);
    });
  });

  group('search', () {
    final apodMap = {'title': 'Test Title', 'url': 'http://example.com'};
    final apodEntity = ApodEntity.fromMap(apodMap);
    final date = DateTime(2021, 1, 1);

    test('should return ApodEntity when the call to remote provider is successful', () async {
      when(mockApodRemoteProvider.search(date: date)).thenAnswer((_) async => apodMap);

      final result = await repository.search(date: date);

      expect(result, equals(apodEntity));
      verify(mockApodRemoteProvider.search(date: date));
      verifyNoMoreInteractions(mockApodRemoteProvider);
    });

    test('should return null when the call to remote provider returns null', () async {
      when(mockApodRemoteProvider.search(date: date)).thenAnswer((_) async => null);

      final result = await repository.search(date: date);

      expect(result, isNull);
      verify(mockApodRemoteProvider.search(date: date));
      verifyNoMoreInteractions(mockApodRemoteProvider);
    });

    test('should throw an exception when the call to remote provider throws an exception', () async {
      when(mockApodRemoteProvider.search(date: date)).thenThrow(Exception('Error'));

      expect(() => repository.search(date: date), throwsA(isA<Exception>()));
      verify(mockApodRemoteProvider.search(date: date));
      verifyNoMoreInteractions(mockApodRemoteProvider);
    });
  });
}
