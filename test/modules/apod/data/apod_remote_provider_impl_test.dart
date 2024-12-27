import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:intl/intl.dart';
import 'package:nasa_challenge/app/core/client/contract/i_client.dart';
import 'package:nasa_challenge/app/core/constants/app_token.dart';
import 'package:nasa_challenge/app/modules/apod/data/apod_remote_provider_impl.dart';
import 'mocks/apod_remote_provider_impl_test.mocks.dart';

@GenerateMocks([IClient])
void main() {
  late MockIClient mockClient;
  late ApodRemoteProviderImpl apodRemoteProvider;

  setUp(() {
    mockClient = MockIClient();
    apodRemoteProvider = ApodRemoteProviderImpl(client: mockClient);
  });

  group('ApodRemoteProviderImpl', () {
    test('getApodDay deve retornar dados quando a requisição é bem-sucedida', () async {
      final mockResponseData = {'title': 'A Photo of the Day', 'url': 'https://example.com/photo.jpg'};

      when(mockClient.get(any, queryParameters: anyNamed('queryParameters'))).thenAnswer((_) async => Future.value(MockResponse(mockResponseData)));

      final result = await apodRemoteProvider.getApodDay();

      expect(result, mockResponseData);
    });

    test('search deve adicionar a data formatada corretamente ao queryParameters', () async {
      final mockResponseData = {'title': 'A Photo of a Specific Day', 'url': 'https://example.com/photo.jpg'};

      final DateTime testDate = DateTime(2024, 12, 24);
      final String formattedDate = DateFormat('yyyy-MM-dd').format(testDate);

      when(mockClient.get(any, queryParameters: anyNamed('queryParameters'))).thenAnswer((_) async => Future.value(MockResponse(mockResponseData)));

      final result = await apodRemoteProvider.search(date: testDate);

      verify(mockClient.get('/planetary/apod', queryParameters: {
        'api_key': AppToken.staticToken,
        'date': formattedDate,
      }));

      expect(result, mockResponseData);
    });
  });
}

// Classe mock de resposta para simular as respostas da API
class MockResponse {
  final dynamic data;

  MockResponse(this.data);
}
