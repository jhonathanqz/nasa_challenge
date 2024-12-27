import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nasa_challenge/app/modules/apod/domain/entities/apod_entity.dart';
import 'package:nasa_challenge/app/modules/apod/infra/apod_local_repository_impl.dart';
import 'package:nasa_challenge/app/modules/apod/infra/contract/apod_local_provider.dart';

import 'mocks/apod_local_repository_impl_test.mocks.dart';

@GenerateMocks([ApodLocalProvider])
void main() {
  late ApodLocalRepositoryImpl repository;
  late MockApodLocalProvider mockApodLocalProvider;

  setUp(() {
    mockApodLocalProvider = MockApodLocalProvider();
    repository = ApodLocalRepositoryImpl(apodLocalProvider: mockApodLocalProvider);
  });

  group('ApodLocalRepositoryImpl', () {
    final apodEntity = ApodEntity(
      date: '2021-10-10',
      explanation: 'Test explanation',
      mediaType: 'image',
      title: 'Test title',
      url: 'https://example.com/image.jpg',
      hdurl: '',
      serviceVersion: '',
      isFavorite: false,
    );

    test('should return list of ApodEntity when getAllFavorites is called', () async {
      // Arrange
      when(mockApodLocalProvider.getAllFavorites()).thenAnswer((_) async => [apodEntity.toJson()]);

      // Act
      final result = await repository.getAllFavorites();

      // Assert
      expect(result, isA<List<ApodEntity>>());
      expect(result.length, 1);
      expect(result.first, isA<ApodEntity>());
      expect(result.first.date, apodEntity.date);
      expect(result.first.explanation, apodEntity.explanation);
      expect(result.first.mediaType, apodEntity.mediaType);
      expect(result.first.title, apodEntity.title);
      expect(result.first.url, apodEntity.url);
    });

    test('should return empty list when getAllFavorites returns empty', () async {
      // Arrange
      when(mockApodLocalProvider.getAllFavorites()).thenAnswer((_) async => []);

      // Act
      final result = await repository.getAllFavorites();

      // Assert
      expect(result, isEmpty);
    });

    test('should return list of ApodEntity when removeFavorite is called', () async {
      // Arrange
      when(mockApodLocalProvider.removeFavorite(apodEntity: apodEntity)).thenAnswer((_) async => [apodEntity.toJson()]);

      // Act
      final result = await repository.removeFavorite(apodEntity: apodEntity);

      // Assert
      expect(result, isA<List<ApodEntity>>());
      expect(result.length, 1);
      expect(result.first, apodEntity);
    });

    test('should return empty list when removeFavorite returns empty', () async {
      // Arrange
      when(mockApodLocalProvider.removeFavorite(apodEntity: apodEntity)).thenAnswer((_) async => []);

      // Act
      final result = await repository.removeFavorite(apodEntity: apodEntity);

      // Assert
      expect(result, isEmpty);
    });

    test('should return true when saveFavorite is called', () async {
      // Arrange
      when(mockApodLocalProvider.saveFavorite(apodEntity: apodEntity)).thenAnswer((_) async => true);

      // Act
      final result = await repository.saveFavorite(apodEntity: apodEntity);

      // Assert
      expect(result, true);
    });

    test('should return false when saveFavorite fails', () async {
      // Arrange
      when(mockApodLocalProvider.saveFavorite(apodEntity: apodEntity)).thenAnswer((_) async => false);

      // Act
      final result = await repository.saveFavorite(apodEntity: apodEntity);

      // Assert
      expect(result, false);
    });
  });
}
