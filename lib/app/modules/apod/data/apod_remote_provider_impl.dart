import 'package:intl/intl.dart';
import 'package:nasa_challenge/app/core/client/i_client.dart';
import 'package:nasa_challenge/app/core/constants/app_token.dart';
import 'package:nasa_challenge/app/modules/apod/infra/contract/apod_remote_provider.dart';

class ApodRemoteProviderImpl implements ApodRemoteProvider {
  final IClient _client;

  ApodRemoteProviderImpl({
    required IClient client,
  }) : _client = client;

  @override
  Future<dynamic> getApodDay({bool isHightQuality = false}) async {
    try {
      final response = await _client.get(
        '/planetary/apod',
        queryParameters: _baseQuery,
      );

      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> search({
    DateTime? date,
  }) async {
    try {
      Map<String, dynamic> query = _baseQuery;

      if (date != null) {
        String formattedDate = DateFormat('yyyy-MM-dd').format(date);
        query['date'] = formattedDate;
      }

      final response = await _client.get(
        '/planetary/apod',
        queryParameters: query,
      );

      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  final Map<String, dynamic> _baseQuery = {
    'api_key': AppToken.staticToken,
  };
}
