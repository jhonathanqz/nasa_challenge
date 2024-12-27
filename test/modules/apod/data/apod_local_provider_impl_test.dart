import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nasa_challenge/app/modules/apod/data/apod_local_provider_impl.dart';
import 'package:nasa_challenge/app/modules/apod/domain/entities/apod_entity.dart';
import 'package:nasa_challenge/app/modules/localstorage/presentation/mobx/db.store.dart';

import 'mocks/apod_local_provider_impl_test.mocks.dart';

@GenerateMocks([DBStore])
void main() {
  late ApodLocalProviderImpl apodLocalProvider;
  late MockDBStore mockDBStore;

  setUp(() {
    mockDBStore = MockDBStore();
    apodLocalProvider = ApodLocalProviderImpl(dbStore: mockDBStore);
  });

  group('ApodLocalProviderImpl', () {
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

    test('should return all favorites', () async {
      when(mockDBStore.get('apod_key')).thenAnswer((_) async => ['favorite1', 'favorite2']);

      final result = await apodLocalProvider.getAllFavorites();

      expect(result, ['favorite1', 'favorite2']);
      verify(mockDBStore.get('apod_key')).called(1);
    });

    test('should save a favorite', () async {
      when(mockDBStore.get('apod_key')).thenAnswer((_) async => []);
      when(mockDBStore.put('apod_key', [])).thenAnswer((_) async => {});

      final result = await apodLocalProvider.saveFavorite(apodEntity: apodEntity);

      expect(result, true);
      verify(mockDBStore.get('apod_key')).called(1);
      verify(mockDBStore.put('apod_key', [apodEntity.toJson()])).called(1);
    });

    test('should remove a favorite', () async {
      when(mockDBStore.get('apod_key')).thenAnswer((_) async => [apodEntity.toJson()]);
      when(mockDBStore.put('apod_key', [])).thenAnswer((_) async => {});

      final result = await apodLocalProvider.removeFavorite(apodEntity: apodEntity);

      expect(result, []);
      verify(mockDBStore.get('apod_key')).called(1);
      verify(mockDBStore.put('apod_key', [])).called(1);
    });

    test('should not remove a favorite if it does not exist', () async {
      when(mockDBStore.get('apod_key')).thenAnswer((_) async => []);

      final result = await apodLocalProvider.removeFavorite(apodEntity: apodEntity);

      expect(result, []);
      verify(mockDBStore.get('apod_key')).called(1);
      verifyNever(mockDBStore.put('apod_key', []));
    });

    test('should not save a favorite if it already exists', () async {
      when(mockDBStore.get('apod_key')).thenAnswer((_) async => [apodEntity.toJson()]);

      final result = await apodLocalProvider.saveFavorite(apodEntity: apodEntity);

      expect(result, true);
      verify(mockDBStore.get('apod_key')).called(1);
      verifyNever(mockDBStore.put('apod_key', []));
    });
  });
}
