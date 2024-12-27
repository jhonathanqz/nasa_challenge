import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nasa_challenge/app/core/domain/exceptions/api_exception.dart';
import 'package:nasa_challenge/app/core/domain/i_usecase.dart';
import 'package:nasa_challenge/app/modules/apod/domain/entities/apod_entity.dart';
import 'package:nasa_challenge/app/modules/apod/domain/repository/apod_remote_repository.dart';
import 'package:nasa_challenge/app/modules/apod/domain/usecase/get_apod_day_usecase.dart';

import '../mocks/search_apod_usecase_test.mocks.dart';

@GenerateMocks([ApodRemoteRepository])
void main() {
  late GetApodDayUsecase usecase;
  late MockApodRemoteRepository mockRepository;

  setUp(() {
    mockRepository = MockApodRemoteRepository();
    usecase = GetApodDayUsecase(apodRemoteRepository: mockRepository);
  });

  final tApodEntity = ApodEntity(
    title: 'Test Title',
    explanation: 'Test Explanation',
    url: 'https://example.com/image.jpg',
    date: DateTime.now().toString(),
    hdurl: '',
    mediaType: '',
    serviceVersion: '',
    isFavorite: false,
  );

  test('should return ApodEntity when the call to repository is successful', () async {
    // arrange
    when(mockRepository.getApodDay()).thenAnswer((_) async => tApodEntity);

    // act
    final result = await usecase(NoParams());

    // assert
    expect(result.isSuccess, true);
    expect(result.data, tApodEntity);
    verify(mockRepository.getApodDay());
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return error message when the call to repository returns null', () async {
    // arrange
    when(mockRepository.getApodDay()).thenAnswer((_) async => null);

    // act
    final result = await usecase(NoParams());

    // assert
    expect(result.isSuccess, false);
    expect(result.error, 'Nenhum dado encontrado com os filtros informados.');
    verify(mockRepository.getApodDay());
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return error message when the call to repository throws ApiExceptions', () async {
    // arrange
    when(mockRepository.getApodDay()).thenThrow(ApiErrorException('API Error'));

    // act
    final result = await usecase(NoParams());

    // assert
    expect(result.isSuccess, false);
    expect(result.error, 'API Error');
    verify(mockRepository.getApodDay());
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return error message when the call to repository throws an exception', () async {
    // arrange
    when(mockRepository.getApodDay()).thenThrow(Exception('Generic Error'));

    // act
    final result = await usecase(NoParams());

    // assert
    expect(result.isSuccess, false);
    expect(result.error, 'Erro: Exception: Generic Error');
    verify(mockRepository.getApodDay());
    verifyNoMoreInteractions(mockRepository);
  });
}
