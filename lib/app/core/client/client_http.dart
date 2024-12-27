import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:dio_logger_request/dio_logger_request.dart';

import '../config/app_environment_setup.dart';
import '../constants/app_token.dart';
import 'client_factory.dart';

import '../domain/interceptor/retry_interceptor.dart';

class ClientHTTP {
  ClientHTTP() {
    setupClient();
    setupClientJwt();
  }

  static Dio setupClientJwt() {
    getEnvironmentSettings();
    final client = ClientFactory.baseClientJwt!;
    client.options.baseUrl = AppToken.urlBase;
    client.options.headers = {
      'Content-Type': 'application/json',
    };
    client.options.followRedirects = false;
    client.options.connectTimeout = const Duration(seconds: 30);
    client.options.receiveTimeout = const Duration(seconds: 90);

    client.interceptors.add(RetryOn500Interceptor(client));
    if (AppEnvironmentSetup.appSetup.isDioLogger) {
      client.interceptors.add(dioLoggerRequestInterceptor);
    }

    return client;
  }

  static Dio setupClient({
    String? urlBase,
  }) {
    getEnvironmentSettings();
    final client = ClientFactory.baseClient!;

    client.options.baseUrl = AppToken.urlBase;
    client.options.headers = {
      'Content-Type': 'application/json',
    };
    client.options.followRedirects = false;
    client.options.connectTimeout = const Duration(seconds: 30);
    client.options.receiveTimeout = const Duration(seconds: 90);
    // client.interceptors.add(AppTokenInterceptor());
    client.interceptors.add(RetryOn500Interceptor(client));
    if (AppEnvironmentSetup.appSetup.isDioLogger) {
      client.interceptors.add(dioLoggerRequestInterceptor);
    }

    return client;
  }

  static Dio get clientBase => setupClient();

  static Dio get clientJWT => setupClientJwt();

  static getEnvironmentSettings() {
    final String currentEnvironment = AppEnvironmentSetup.environment.name.toUpperCase();
    AppToken.staticToken = dotenv.get('STATIC_TOKEN');
    AppToken.urlBase = dotenv.get(currentEnvironment);
  }
}
