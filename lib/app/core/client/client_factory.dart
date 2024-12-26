import 'package:dio/dio.dart';

class ClientFactory {
  static Dio? _baseClient;

  static Dio? get baseClient {
    _baseClient ??= Dio();

    return _baseClient;
  }

  static Dio? _clientJwt;

  static Dio? get baseClientJwt {
    _clientJwt ??= Dio();

    return _clientJwt;
  }
}
