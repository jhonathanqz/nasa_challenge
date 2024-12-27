import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nasa_challenge/app/modules/apod/domain/entities/apod_entity.dart';
import 'package:nasa_challenge/app/modules/apod/domain/repository/apod_local_repository.dart';
import 'package:nasa_challenge/app/modules/apod/domain/usecase/save_apod_favorite_usecase.dart';

import '../mocks/save_apod_favorite_usecase_test.mocks.dart';

@GenerateMocks([ApodLocalRepository])
void main() {
  late SaveApodFavoriteUsecase usecase;
  late MockApodLocalRepository mockApodLocalRepository;

  setUp(() {
    mockApodLocalRepository = MockApodLocalRepository();
    usecase = SaveApodFavoriteUsecase(apodLocalRepository: mockApodLocalRepository);
  });

  final apodEntity = ApodEntity(
    date: '2021-10-10',
    explanation: 'Test explanation',
    mediaType: 'image',
    title: 'Test title',
    url: 'https://example.com/image.jpg',
    isFavorite: false,
    hdurl: '',
    serviceVersion: '',
  );

  test('should save apod as favorite and return success', () async {
    // arrange
    when(mockApodLocalRepository.saveFavorite(apodEntity: anyNamed('apodEntity'))).thenAnswer((_) async => true);

    // act
    final result = await usecase(apodEntity);

    // assert
    expect(result.isSuccess, true);
    expect(result.data, true);
    verify(mockApodLocalRepository.saveFavorite(apodEntity: apodEntity.copyWith(isFavorite: true)));
    verifyNoMoreInteractions(mockApodLocalRepository);
  });

  test('should return error when saving fails', () async {
    // arrange
    when(mockApodLocalRepository.saveFavorite(apodEntity: anyNamed('apodEntity'))).thenThrow(Exception('Failed to save'));

    // act
    final result = await usecase(apodEntity);

    // assert
    expect(result.isError, true);
    expect(result.error, 'Erro: Exception: Failed to save');
    verify(mockApodLocalRepository.saveFavorite(apodEntity: apodEntity.copyWith(isFavorite: true)));
    verifyNoMoreInteractions(mockApodLocalRepository);
  });
}
