import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nasa_challenge/app/core/domain/exceptions/api_exception.dart';
import 'package:nasa_challenge/app/modules/apod/domain/entities/apod_entity.dart';
import 'package:nasa_challenge/app/modules/apod/domain/repository/apod_remote_repository.dart';
import 'package:nasa_challenge/app/modules/apod/domain/usecase/search_apod_usecase.dart';

import '../mocks/search_apod_usecase_test.mocks.dart';

@GenerateMocks([ApodRemoteRepository])
void main() {
  late SearchApodUsecase usecase;
  late MockApodRemoteRepository mockRepository;

  setUp(() {
    mockRepository = MockApodRemoteRepository();
    usecase = SearchApodUsecase(apodRemoteRepository: mockRepository);
  });

  final tDate = DateTime(2021, 10, 10);
  final tApodEntity = ApodEntity(
    date: tDate.toString(),
    explanation: 'Test explanation',
    mediaType: 'image',
    title: 'Test title',
    url: 'https://example.com/image.jpg',
    hdurl: '',
    serviceVersion: '',
    isFavorite: false,
  );

  test('should return ApodEntity when the call to repository is successful', () async {
    // arrange
    when(mockRepository.search(date: anyNamed('date'))).thenAnswer((_) async => tApodEntity);
    // act
    final result = await usecase(tDate);
    // assert
    expect(result.isSuccess, true);
    expect(result.data, tApodEntity);
    verify(mockRepository.search(date: tDate));
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return error message when the call to repository returns null', () async {
    // arrange
    when(mockRepository.search(date: anyNamed('date'))).thenAnswer((_) async => null);
    // act
    final result = await usecase(tDate);
    // assert
    expect(result.isSuccess, false);
    expect(result.error, 'Nenhum dado encontrado com os filtros informados.');
    verify(mockRepository.search(date: tDate));
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return error message when the call to repository throws ApiExceptions', () async {
    // arrange
    when(mockRepository.search(date: anyNamed('date'))).thenThrow(ApiErrorException('API error'));
    // act
    final result = await usecase(tDate);
    // assert
    expect(result.isSuccess, false);
    expect(result.error, 'API error');
    verify(mockRepository.search(date: tDate));
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return error message when the call to repository throws an exception', () async {
    // arrange
    when(mockRepository.search(date: anyNamed('date'))).thenThrow(Exception('Generic error'));
    // act
    final result = await usecase(tDate);
    // assert
    expect(result.isSuccess, false);
    expect(result.error, 'Erro: Exception: Generic error');
    verify(mockRepository.search(date: tDate));
    verifyNoMoreInteractions(mockRepository);
  });
}
