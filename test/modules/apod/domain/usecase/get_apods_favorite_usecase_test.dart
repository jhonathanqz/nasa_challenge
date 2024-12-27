import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nasa_challenge/app/core/domain/i_usecase.dart';
import 'package:nasa_challenge/app/modules/apod/domain/entities/apod_entity.dart';
import 'package:nasa_challenge/app/modules/apod/domain/repository/apod_local_repository.dart';
import 'package:nasa_challenge/app/modules/apod/domain/usecase/get_apods_favorite_usecase.dart';

import '../mocks/get_apods_favorite_usecase_test.mocks.dart';

@GenerateMocks([ApodLocalRepository])
void main() {
  late GetApodsFavoriteUsecase usecase;
  late MockApodLocalRepository mockApodLocalRepository;

  setUp(() {
    mockApodLocalRepository = MockApodLocalRepository();
    usecase = GetApodsFavoriteUsecase(apodLocalRepository: mockApodLocalRepository);
  });

  final tApodEntity = ApodEntity(
    title: 'Test 1',
    url: 'url1',
    explanation: 'Test Explanation',
    date: DateTime.now().toString(),
    hdurl: '',
    mediaType: '',
    serviceVersion: '',
    isFavorite: false,
  );

  final tApodEntity2 = ApodEntity(
    title: 'Test 2',
    url: 'url2',
    explanation: 'Test Explanation',
    date: DateTime.now().toString(),
    hdurl: '',
    mediaType: '',
    serviceVersion: '',
    isFavorite: false,
  );

  final tApodEntityList = [
    tApodEntity,
    tApodEntity2,
  ];

  test('should return list of ApodEntity when the call to repository is successful', () async {
    // arrange
    when(mockApodLocalRepository.getAllFavorites()).thenAnswer((_) async => tApodEntityList);

    // act
    final result = await usecase(NoParams());

    // assert
    expect(result.isSuccess, true);
    expect(result.data, tApodEntityList);
    verify(mockApodLocalRepository.getAllFavorites());
    verifyNoMoreInteractions(mockApodLocalRepository);
  });

  test('should return error message when there are no favorites', () async {
    // arrange
    when(mockApodLocalRepository.getAllFavorites()).thenAnswer((_) async => []);

    // act
    final result = await usecase(NoParams());

    // assert
    expect(result.isError, true);
    expect(result.error, 'Nenhum favorito foi encontrado.');
    verify(mockApodLocalRepository.getAllFavorites());
    verifyNoMoreInteractions(mockApodLocalRepository);
  });

  test('should return error message when the call to repository throws an exception', () async {
    // arrange
    when(mockApodLocalRepository.getAllFavorites()).thenThrow(Exception('Some error'));

    // act
    final result = await usecase(NoParams());

    // assert
    expect(result.isError, true);
    expect(result.error, 'Erro: Exception: Some error');
    verify(mockApodLocalRepository.getAllFavorites());
    verifyNoMoreInteractions(mockApodLocalRepository);
  });
}
