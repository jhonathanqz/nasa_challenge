import 'package:dio/dio.dart';

import '../utils/strings.dart';

class ApiHelper {
  static String buildMessageResponse(Response<dynamic>? response) {
    if (response != null && response.data['message'] != null) {
      return response.data['message'].toString();
    }
    if (response != null && response.data != null) {
      return response.data.toString();
    }
    return _defaultMessage(response?.statusCode);
  }

  static String _defaultMessage(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad Request';
      case 401:
        return 'Acesso não autorizado.';
      case 403:
        return 'Erro de autenticação.';
      case 404:
        return 'Nenhum dado encontrado.';
      case 412:
        return Strings.exceptions.sessionExpired;
      case 500:
        return 'Erro interno no servidor. Tente novamente.';
      default:
        return 'Erro interno. Falha de conexão.';
    }
  }
}
