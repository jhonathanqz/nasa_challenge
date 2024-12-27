import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nasa_challenge/app/modules/apod/domain/entities/apod_entity.dart';
import 'package:nasa_challenge/app/modules/apod/domain/repository/apod_local_repository.dart';
import 'package:nasa_challenge/app/modules/apod/domain/usecase/remove_apod_favorite_usecase.dart';

import '../mocks/remove_apod_favorite_usecase_test.mocks.dart';

@GenerateMocks([ApodLocalRepository])
void main() {
  late RemoveApodFavoriteUsecase usecase;
  late MockApodLocalRepository mockRepository;

  setUp(() {
    mockRepository = MockApodLocalRepository();
    usecase = RemoveApodFavoriteUsecase(apodLocalRepository: mockRepository);
  });

  final apodEntity = ApodEntity(
    title: 'Test Title',
    date: '2021-10-10',
    explanation: 'Test Explanation',
    url: 'https://example.com/image.jpg',
    hdurl: '',
    mediaType: '',
    serviceVersion: '',
    isFavorite: false,
  );

  test('should remove favorite and return success result', () async {
    // arrange
    when(mockRepository.removeFavorite(apodEntity: apodEntity)).thenAnswer((_) async => [apodEntity]);

    // act
    final result = await usecase(apodEntity);

    // assert
    expect(result.isSuccess, true);
    expect(result.data, [apodEntity]);
    verify(mockRepository.removeFavorite(apodEntity: apodEntity));
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return error result when exception is thrown', () async {
    // arrange
    when(mockRepository.removeFavorite(apodEntity: apodEntity)).thenThrow(Exception('Failed to remove favorite'));

    // act
    final result = await usecase(apodEntity);

    // assert
    expect(result.isError, true);
    expect(result.error, 'Erro: Exception: Failed to remove favorite');
    verify(mockRepository.removeFavorite(apodEntity: apodEntity));
    verifyNoMoreInteractions(mockRepository);
  });
}
