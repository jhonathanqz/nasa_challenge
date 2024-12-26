import 'package:dio/dio.dart';

class RetryOn500Interceptor extends Interceptor {
  final Dio dio;
  RetryOn500Interceptor(this.dio);

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 500 && err.requestOptions.extra['retryServer'] == null) {
      // Marcar a requisição para não tentar novamente
      err.requestOptions.extra['retryServer'] = true;

      try {
        // Refazer a requisição original com a propriedade extra
        final response = await dio.request(
          err.requestOptions.path,
          options: Options(
            method: err.requestOptions.method,
            headers: err.requestOptions.headers,
            extra: err.requestOptions.extra,
          ),
          data: err.requestOptions.data,
          queryParameters: err.requestOptions.queryParameters,
        );
        return handler.resolve(response);
      } catch (e) {
        return handler.reject(err);
      }
    }
    return handler.next(err);
  }
}
